import 'package:flutter/material.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/components/constants.dart';
import 'package:nibton_app/screens/layout/layout_screen.dart';

import 'componnent/body.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';


// ignore: use_key_in_widget_constructors
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F5F6F8"),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height*0.7),
          child: Container(
            padding:  EdgeInsets.only(top: 9.h,left: 5.w,bottom: 2.h,right: 3.w),
            child: Row(
              children: [
                InkWell(
                    onTap: ()=>Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios,color: HexColor('#4CB8BA'),size: 25,)),
                SizedBox(width: 2.w,),
                Text(LocaleKeys.Shipping.tr(),style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: HexColor('#515C6F'),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600
                ),),

              ],
            ),)),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 4.h,right: 2.w),
        child: FloatingActionButton(
          backgroundColor: HexColor("#4CB8BA"),
          foregroundColor: HexColor("#4CB8BA"),
          child:
              Image.asset('assets/images/Home1.png',),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LayoutScreen(index: 0))),
        ),
      ),
      body: CartBody(),
    );
  }
}
