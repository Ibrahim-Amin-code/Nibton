import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/categories/categories_component/component.dart';
import 'package:nibton_app/screens/filtter/filtter_class.dart';
import 'package:nibton_app/screens/home/home_component/home_component.dart';
import 'package:nibton_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nibton_app/screens/home/home_cubit/states.dart';
import 'package:nibton_app/screens/menu_screens/profile/get_profile_cubit/states.dart';
import 'package:nibton_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:nibton_app/screens/product_detail/product_detail_screen.dart';
import 'package:nibton_app/screens/see_all/component/compoenet.dart';
import 'package:nibton_app/screens/see_all/sell_all_screen.dart';

import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class AllBrands extends StatelessWidget {
  // const AllBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height*0.4),
          child: Container(
            // color: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04,),
            child: Padding(
              padding: EdgeInsets.only(top: 3.h,bottom: 2.h),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,size: 25,)),
                  SizedBox(width: 2.w,),
                  Text(LocaleKeys.Brands.tr(),style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: HexColor('#515C6F'),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ),)),
      body: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state){
          return
            ConditionalBuilder(
              condition: state is! HomeLoadingState,
              builder: (context)=> GridView.count(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 2.5.w,
                crossAxisSpacing: 3.h,
                childAspectRatio: 0.8,
                primary: true,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                children: List.generate(HomeCubit.get(context).data.length, (index) => buildBrands(
                    context: context,
                    title: HomeCubit.get(context).data[index]['name'], pathImage: HomeCubit.get(context).data[index]['logo']),),

                // itemCount: HomeCubit.get(context).data.length,
              ),
              fallback: (context)=>  Center(child: CircularProgressIndicator()),
              // child:
            );
        },
      ),
    );
  }
  Widget buildBrands({
    required String pathImage,
    required String title,
    context
  })=> Container(
    width: 120,
    child: Stack(
      children: [
        Container(
          // height: 45.h,
          // width: 50.w,
          child: customCachedNetworkImage(url: pathImage, context: context, fit: BoxFit.cover),
        ),
        Container(
          width: double.infinity,
          // height: 40,
          margin: EdgeInsets.only(top: 20.h),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [HexColor('#40A2A6'), HexColor('#4CB8BA')])),

          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 18.w),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 10.sp,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
                color: HexColor('#FFFFFF'),
              ),
            ),
          ),
        )
      ],
    ),
  );

}
