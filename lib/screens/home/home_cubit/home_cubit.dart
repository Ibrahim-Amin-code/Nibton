import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nibton_app/models/all_offers.dart';
import 'package:nibton_app/models/contact_model.dart';
import 'package:http/http.dart' as http;
import 'package:nibton_app/models/get_products_model.dart';
import 'package:nibton_app/models/reviews_model.dart';
import 'package:nibton_app/models/wish_list_model.dart';
import 'package:nibton_app/network/cache/cache_helper.dart';
import 'package:nibton_app/network/dio/dio_helper.dart';
import 'package:nibton_app/network/end_points.dart';
import 'package:nibton_app/screens/components/constants.dart';
import 'package:nibton_app/screens/home/home_cubit/states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);


   List data=[];

  void getShops(){
    emit(HomeLoadingState());
    DioHelper.getData(
      url: GetShops,

    ).then((value) {
      data.clear();
      data.addAll(value.data['data']);
      emit(HomeSuccessState());
    }).catchError((error) {
      emit(HomeErrorState(error.toString()));
      print(error.toString());
    });
  }


  List categories=[];

  void getCategories()async {
   String lang = await CacheHelper.getData(key: 'lang')?? 'en';
    emit(CategoriesLoadingState());
    DioHelper.getData(
      url: GetCategories,
      query: {
        'lang':lang,
      }
    ).then((value) {
      categories.clear();
      categories.addAll(value.data['data']);
      emit(CategoriesSuccessState());
    }).catchError((error) {
      emit(CategoriesErrorState(error.toString()));
      print(error.toString());
    });
  }


  GetProductsModel getProductsModel = GetProductsModel();

  void getProducts({
     String? id,
     String? brandId,
    // required String lang,
}) async{
    String lang = await CacheHelper.getData(key: 'lang')??'en';
    emit(ProductsLoadingState());
    DioHelper.getData(
        url: GetProducts,
        query: {
        'categoryId': '$id',
        'shopId': '$brandId',
        'lang': lang,
        }
    ).then((value){
      // print(value.data);
      getProductsModel = GetProductsModel.fromJson(value.data);
      emit(ProductsSuccessState());
    }).catchError((error) {
      emit(ProductsErrorState(error.toString()));
      print(error.toString());
    });
  }



  // void getAllProducts() async{
  //   String lang = await CacheHelper.getData(key: 'lang')?? 'en';
  //   emit(AllProductsLoadingState());
  //   DioHelper.getData(
  //       url: GetProducts,
  //       query: {
  //         // 'categoryId': '$id',
  //         'lang': lang,
  //       }
  //
  //   ).then((value){
  //     print('-----------------------------------------------------------------------------------'+lang.toString());
  //     getProductsModel = GetProductsModel.fromJson(value.data);
  //     emit(AllProductsSuccessState());
  //   }).catchError((error) {
  //     emit(AllProductsErrorState(error.toString()));
  //     print(error.toString());
  //   });
  // }



  ContactModel contactModel =ContactModel();

  void contactInfo(){
    emit(ContactInfoLoadingState());
    DioHelper.getData(
        url: ContactInfo,
    ).then((value) {
      contactModel = ContactModel.fromJson(value.data);
      emit(ContactInfoSuccessState());
    }).catchError((error) {
      emit(ContactInfoErrorState(error.toString()));
      print(error.toString());
    });
  }

  List brandData=[];

  void getBanners(){
    emit(GetBrandLoadingState());
    DioHelper.getData(
        url: GetBanners,
    ).then((value) {
      brandData.clear();
      brandData.addAll(value.data['data']);
      // print(value.data);
      emit(GetBrandSuccessState());
    }).catchError((error) {
      emit(GetBrandErrorState(error.toString()));
      print(error.toString());
    });
  }


  void addToCart({
  required String id,
})async {
    emit(AddToCartLoadingState());
   String token = await CacheHelper.getData(key: 'token');
    DioHelper.postData(
      url: AddToCart,
        data: {
      "productId": id,
        },
      token: 'Bearer $token',
    ).then((value) {
      emit(AddToCartSuccessState());
      print('AddToCart--------------------------------------------'+value.data['msg']);
      Fluttertoast.showToast(
          msg: value.data['msg'].toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: HexColor("#B59945"),
          textColor: HexColor('#727C8E'),
          fontSize: 16.0);
          getCard();
    }).catchError((error){
      emit(AddToCartErrorState(error.toString()));
      print(error.toString());
    });
  }






List cart =[];


  void getCard() async
  {
    emit(GetCartLoadingState());
    String token = await CacheHelper.getData(key: 'token')??'';
    DioHelper.getData(
        url: GetCarts,
      token: 'Bearer $token',
    ).then((value) {
      cart.clear();
      cart.addAll(value.data!['data']);
      emit(GetCartSuccessState());
    }).catchError((error){
      emit(GetCartErrorState(error.toString()));
        print(error.toString());
    });
    // String token = await CacheHelper.getData(key: 'token');
    // try{
    //   var response = await http.get(Uri.parse('https://findfamily.net/eshop/api/buyers/product/carts'),
    //       headers: {
    //     'Authorization': 'Bearer $token',
    //   },);
    //   cartModel = CartModel.fromJson(json.decode(response.body));
    //   print('cartModel------------------------------------------'+response.body);
    //   emit(GetCartSuccessState());
    // }
    // catch(error){
    //   emit(GetCartErrorState(error.toString()));
    //   print(error.toString());
    // }
  }

  dynamic contact;

  void contactUs({
  required String name,
  required String subject,
  required String phone,
  required String email,
  required String message,
})async {
    emit(ContactUsLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    DioHelper.postContactUsData(
        url: ContactUs,
        token: 'Bearer $token',
        data: {
      'name':name,
      'subject':subject,
      'phone':phone,
      'email':email,
      'message':message,
        }).then((value) {
      contact = value.data['msg'];
          emit(ContactUsSuccessState());
    }).catchError((error){
      emit(ContactUsErrorState(error.toString()));
      print(error.toString());
    });

  }

  String msg = '';
  Map<String,bool> isFavourite= {};

  void addToWishList({
    required String id,
  })async {
    emit(WishListLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    DioHelper.postWishListData(
        url: wishlists,
        token: 'Bearer $token',
        query: {
          'productId':'$id',
        }).then((value) {
      msg = value.data['msg'];
      Fluttertoast.showToast(
          msg: msg.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: HexColor("#B59945"),
          textColor: HexColor('#727C8E'),
          fontSize: 16.0);
      isFavourite["$id"] = true;
      print('-----------------------------------------------${msg.toString()}');
      emit(WishListSuccessState());
    }).catchError((error){
      emit(WishListErrorState(error.toString()));
      print('error------------------------------------------------------'+error.toString());
    });
  }

  WishListModel wishListModel =WishListModel();

  List wish = [];

  void getWishList()async
  {
    emit(GetWishListLoadingState());
    String token = await CacheHelper.getData(key: 'token')??'';
    String lang = await CacheHelper.getData(key: 'lang')?? 'en';

    try{
      var response = await http.get(Uri.parse('https://findfamily.net/eshop/api/buyers/product/wishlists?lang=$lang'),
          headers: {
        'Authorization': 'Bearer $token',
      },);
      wish.clear();
      wishListModel = WishListModel.fromJson(json.decode(response.body));
      var data = json.decode(response.body);
      wish.addAll(data['data']);

      print('wishListModel----------------------------------------------------------------------------------'+response.body);
      emit(GetWishListSuccessState());
    }
    catch(error){
      emit(GetWishListErrorState(error.toString()));
      print(error.toString());
    }
  }




  AllOffersModel allOffersModel =AllOffersModel();
  void getAllOffers()
  {
    emit(AllOffersLoadingState());
    DioHelper.getData(
      url: AllOffers,
    ).then((value) {
      allOffersModel = AllOffersModel.fromJson(value.data);
      emit(AllOffersSuccessState());
    }).catchError((error)
    {
      emit(AllOffersErrorState(error.toString()));
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr'+error.toString());
    });
  }

  String addReviewMsg = '';

  void addReview({
  required String productId,
  required String comment,
  required double rate,
  required String date,
})async{
    emit(AddReviewLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    String lang = await CacheHelper.getData(key: 'lang')??'en';
    DioHelper.postData(
        url: AddReview,
        data: {
          'productId':productId,
          'comment':comment,
          'rate':rate,
          'date':date,
          'lang':lang,
        },
        token: 'Bearer $token',
    ).then((value){
      addReviewMsg = value.data['msg'];
      Fluttertoast.showToast(
          msg: addReviewMsg.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: HexColor('#727C8E'),
          fontSize: 16.0);
      getReviews(id: productId);
      print(value.data);
      emit(AddReviewSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AddReviewErrorState(error.toString()));
    });
  }


  ClassReviewsModel classReviewsModel =ClassReviewsModel();

void getReviews({
  required String id,
})async{
    emit(AllReviewLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    DioHelper.getData(
      url : AllReviews,
      query: {
        'productId':id
      },
      token: 'Bearer $token',
    ).then((value) {
      classReviewsModel = ClassReviewsModel.fromJson(value.data);
      print(value.data);
      print('------------------------------------------'+id);
      emit(AllReviewSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AllReviewErrorState(error.toString()));
    });
}




}
