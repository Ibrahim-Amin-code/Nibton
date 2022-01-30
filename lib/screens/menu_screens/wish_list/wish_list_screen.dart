import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/cart/cart.dart';
import 'package:nibton_app/screens/categories/categories_component/component.dart';
import 'package:nibton_app/screens/home/home_component/home_component.dart';
import 'package:nibton_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nibton_app/screens/home/home_cubit/states.dart';
import 'package:nibton_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:nibton_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'component/wish_list_component.dart';
import 'package:easy_localization/easy_localization.dart';

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height*0.7),
          child: Container(
            padding:  EdgeInsets.only(top: 8.h,left: 5.w,bottom: 2.h,right: 5.w),
            child: Row(
              children: [
                InkWell(
                    onTap: ()=>Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios,color: HexColor('#4CB8BA'),size: 25,)),
                SizedBox(width: 2.w,),
                Text(LocaleKeys.Wish_List.tr(),style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: HexColor('#515C6F'),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600
                ),),
                  Spacer(),
                  Padding(
                            padding: const EdgeInsets.only(right: 20,top: 15),
                            child: Stack(
                              children: [
                                InkWell(
                                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen())),
                                    child: Image.asset('assets/images/cart-home.png',color: HexColor('#727C8E'),height: 25,)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15,right: 3),
                                  child: CircleAvatar(
                                    radius: 7,
                                    backgroundColor: HexColor('#4CB8BA'),
                                    child: Center(
                                      child: Text('7',style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.white
                                      ),),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
              ],
            ),)),
      body: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state){
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
            children: [
              // (HomeCubit.get(context).wishListModel.data.isNotEmpty)?
              ConditionalBuilder(
                condition: state is! GetWishListLoadingState,
                builder: (context)=>  GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.h,
                  crossAxisSpacing: 1.5.w,
                  childAspectRatio: 1 / 1.55,
                  children:
                  List.generate(
                    //var len = foo?.length ??
                      HomeCubit.get(context).wish.length,
                          (index) =>
                          InkWell(
                            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailsScreen(
                              details: HomeCubit.get(context).wishListModel.data![index],
                            ))),
                            child: SizedBox(
                              height: 41.h,
                              child: buildWishListProductsItem(
                                id: HomeCubit.get(context).wish[index]['id'].toString(),
                                context: context,
                                name: HomeCubit.get(context).wish[index]['name'].toString(),
                                image:HomeCubit.get(context).wish[index]['cover_img'].toString(),
                                price:HomeCubit.get(context).wish[index]['price'].toString(),
                              ),
                            ),
                          )),
                ),
                fallback: (context)=>Center(child: CircularProgressIndicator()),
              ),
              SizedBox(height: 2.h,),
            ],
          );
        },
      ),
    );
  }
}
