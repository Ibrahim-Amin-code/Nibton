import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/all_brands/all_brands_screen.dart';
import 'package:nibton_app/screens/cart/cart.dart';
import 'package:nibton_app/screens/home/home_component/home_component.dart';
import 'package:nibton_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nibton_app/screens/home/home_cubit/states.dart';
import 'package:nibton_app/screens/layout/layout_screen.dart';
import 'package:nibton_app/screens/menu_screens/deals/deals_screen.dart';
import 'package:nibton_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:nibton_app/screens/offers/component/component.dart';
import 'package:nibton_app/screens/product_detail/product_detail_screen.dart';
import 'package:nibton_app/screens/see_all/sell_all_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

import '../search_class.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height*0.4),
          child: Container(
            padding:  EdgeInsets.only(top: 4.h,left: 5.w,bottom: 3.h,right: 4.w),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [HexColor('#40A2A6'),HexColor('#4CB8BA')])),
            child: Row(
              children: [
                Image.asset('assets/images/Menu.png',color: Colors.white,),
                SizedBox(width: 10,),
                Text('ALHAZAZ',style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),),
                Spacer(),
                Image.asset('assets/images/screen.png'),
                SizedBox(width: 5.w,),
                InkWell(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen())),
                    child: Image.asset('assets/images/cart-home.png',width: 30,height: 30,)),
              ],
            ),)),
      body: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state){
          return ListView(
            physics: BouncingScrollPhysics(),
            children: [
              InkWell(
                  onTap: (){
                    showSearch(context: context, delegate: ProductsSearch());
                  },
                  child: buildSearchCardInHomeScreen()),
              SizedBox(height: 3.h,),
              ConditionalBuilder(
                condition: state is! CategoriesLoadingState,
                builder: (context)=> SizedBox(
                  height: 14.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    primary: true,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    itemBuilder: (context,index)=> InkWell(
                      onTap: () {
                        HomeCubit.get(context).getProducts(
                            brandId: '',
                            id: HomeCubit.get(context).categories[index]['id'].toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeeAllScreen()));
                      },
                      child: buildCategoriesItems(
                          pathImage: HomeCubit.get(context).categories[index]['icon'],
                          context: context,
                          title: HomeCubit.get(context).categories[index]['title']),
                    ),
                    separatorBuilder: (context,index)=>SizedBox(width: 1.w,),
                    itemCount: HomeCubit.get(context).categories.length,
                  ),
                ),
                fallback: (context)=>  Center(child: CircularProgressIndicator()),
                // child:
              ),
              CarouselSlider.builder(
                itemCount: 1,
                itemBuilder: (context,index,pageViewIndex){
                  return Image.asset('assets/images/Image 29.png',fit: BoxFit.cover,);
                },
                options: CarouselOptions(
                  height: 150,
                  initialPage: 0,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  aspectRatio: 3,
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  children: [
                    Text(LocaleKeys.Offers.tr(),style: TextStyle(color: HexColor('#515C6F'),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                        fontSize: 16
                    ),),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LayoutScreen(index: 1)));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios,color: HexColor('#515C6F'),size: 15,),
                          Icon(Icons.arrow_forward_ios,color: HexColor('#515C6F'),size: 15,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
          SizedBox(
            height: 33.h,
            child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  shrinkWrap: true,
                  primary: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>InkWell(
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      ProductDetailsScreen(details: HomeCubit.get(context).allOffersModel.data![index])
                      ));
                      },
                    child: buildOffersCardRow(
                      context: context,
                      image:  HomeCubit.get(context).allOffersModel.data![index].coverImg.toString(),
                      price: HomeCubit.get(context).allOffersModel.data![index].price.toString(),
                      newPrice: HomeCubit.get(context).allOffersModel.data![index].offer!.price.toString(),
                      title:  HomeCubit.get(context).allOffersModel.data![index].name.toString(),
                    ),
                  ),
                  separatorBuilder: (context,index)=>SizedBox(width: 3.w,),
                  itemCount: HomeCubit.get(context).allOffersModel.data!.length)),


              SizedBox(height: 2.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  children: [
                    Text(LocaleKeys.Brands.tr(),style: TextStyle(color: HexColor('#515C6F'),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                        fontSize: 16
                    ),),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AllBrands()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios,color: HexColor('#515C6F'),size: 15,),
                          Icon(Icons.arrow_forward_ios,color: HexColor('#515C6F'),size: 15,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h,),


              ConditionalBuilder(
                condition: state is! HomeLoadingState,
                builder: (context)=> SizedBox(
                  height: 21.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    primary: true,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    itemBuilder: (context,index)=>InkWell(
                      onTap: (){
                        HomeCubit.get(context).getProducts(
                          id: '',
                        brandId: HomeCubit.get(context).data[index]['id'].toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeeAllScreen()));
                      },
                      child: buildBrandsItem(
                        context: context,
                          title: HomeCubit.get(context).data[index]['name'], pathImage: HomeCubit.get(context).data[index]['logo']),
                    ),
                    separatorBuilder: (context,index)=>SizedBox(width: 1.w,),
                    itemCount: HomeCubit.get(context).data.length,
                  ),
                ),
                fallback: (context)=>  Center(child: CircularProgressIndicator()),
                // child:
              ),














              SizedBox(height: 1.5.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  children: [
                    Text(LocaleKeys.Deals.tr(),style: TextStyle(color: HexColor('#4CB8BA'),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 14.sp
                    ),),
                    Spacer(),
                    InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DealsScreen())),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios,color: HexColor('#515C6F'),size: 15,),
                          Icon(Icons.arrow_forward_ios,color: HexColor('#515C6F'),size: 15,),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                width: 345,
                height: 157,
                child: Image.asset('assets/images/Image 33.png',fit: BoxFit.cover,),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                decoration: BoxDecoration(
                    color: HexColor('#E5EFEF'),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))
                ),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildTimeCardItem(timeUnm: '06',timeOption: 'DAYS'),
                    buildTimeCardItem(timeUnm: '23',timeOption: 'HOURS'),
                    buildTimeCardItem(timeUnm: '35',timeOption: 'MINS'),
                    buildTimeCardItem(timeUnm: '10',timeOption: 'SECS'),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ConditionalBuilder(
                condition: state is! ProductsLoadingState,
                builder: (context) =>
                  (HomeCubit.get(context).getProductsModel.data!.isNotEmpty)?
                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.w),
                      child: Row(
                        children: [
                          Text(LocaleKeys.New_Products.tr(),style: TextStyle(color: HexColor('#515C6F'),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                              fontSize: 12.sp
                          ),),
                          Spacer(),
                          InkWell(
                            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SeeAllScreen())),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios,color: HexColor('#515C6F'),size: 15,),
                                Icon(Icons.arrow_forward_ios,color: HexColor('#515C6F'),size: 15,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.42,
                      child: ListView.separated(
                          shrinkWrap: true,
                          primary: true,
                          padding: EdgeInsets.symmetric(horizontal: 2.w,),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index)=>InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context)=> ProductDetailsScreen(
                                      details: HomeCubit.get(context).getProductsModel.data![index])));
                            },
                            child: buildNationalDayProductsItem(
                           name: HomeCubit.get(context).getProductsModel.data![index].name.toString(),
                           image: HomeCubit.get(context).getProductsModel.data![index].coverImg.toString(),
                           context: context),
                          ),
                          separatorBuilder:(context,index)=>SizedBox(width: 2.w,),
                          itemCount:HomeCubit.get(context).getProductsModel.data!.length),
                    ),
                  ],
                ) : Container(),
                fallback: (context) =>Center(child: CircularProgressIndicator()),

              ),





              SizedBox(height: 3.h,),
              (HomeCubit.get(context).brandData.isNotEmpty)?
              CarouselSlider.builder(
                itemCount: HomeCubit.get(context).brandData.length,
                itemBuilder: (context,index,pageViewIndex){
                  return Container(
                    child: customCachedNetworkImage(url: HomeCubit.get(context).brandData[index]['banner'], context: context, fit: BoxFit.cover),
                  );
                },
                options: CarouselOptions(
                  height: 130,
                  initialPage: 0,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  aspectRatio: 3,
                ),
              ):
              Container(),
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  children: [
                    Text(LocaleKeys.Mostiviewed_Products.tr(),style: TextStyle(color: HexColor('#515C6F'),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 12.sp
                    ),),
                    Spacer(),
                    InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SeeAllScreen())),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios,color: HexColor('#515C6F'),size: 15,),
                          Icon(Icons.arrow_forward_ios,color: HexColor('#515C6F'),size: 15,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: MediaQuery.of(context).size.height*0.42,
                child: ListView.separated(
                    shrinkWrap: true,
                    primary: true,
                    padding: EdgeInsets.symmetric(horizontal: 2.w,),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>NationalDayProductsItem(image: 'assets/images/Image 37.png',context: context),
                    separatorBuilder:(context,index)=>SizedBox(width: 2.w,),
                    itemCount:5),
              ),
              SizedBox(height: 10,)
            ],
          );
        },
        // child: ,
      ),
    );
  }
}
