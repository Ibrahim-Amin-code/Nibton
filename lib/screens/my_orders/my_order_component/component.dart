
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/home/home_component/home_component.dart';
import 'package:nibton_app/screens/my_orders/orderDetail/orderDetail.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';


Widget buildMyOrderCardItem({
 required context,
  dynamic details,
 required String orderNum,
 required String totalAmount,
 required String itemsNum,
 required String orderStatus,
 required String date,

})=> Container(
  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
  ),
  child: Column(
    children: [
      Row(
        children: [
          Text(LocaleKeys.Order.tr(),style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              color: HexColor('#333333')
          ),),
          Spacer(),
          Text(orderNum,style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              color: HexColor('#4CB8BA')
          ),),

        ],
      ),
      SizedBox(height: 2.h,),
      Row(
        children: [
          Text(LocaleKeys.Total_Amount.tr(),style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              color: HexColor('#333333')
          ),),
          Spacer(),
          Text(totalAmount,style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              color: HexColor('#4CB8BA')
          ),),

        ],
      ),
      SizedBox(height: 2.h,),
      Row(
        children: [
          Text(LocaleKeys.Items.tr(),style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              color: HexColor('#333333')
          ),),
          Spacer(),
          Text(itemsNum,style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              color: HexColor('#4CB8BA')
          ),),
        ],
      ),
      SizedBox(height: 2.h,),
      Row(
        children: [
          Text(LocaleKeys.Order_Status.tr(),style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              color: HexColor('#333333')
          ),),
          Spacer(),
          Text(orderStatus,style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              color: HexColor('#4CB8BA')
          ),),

        ],
      ),
      SizedBox(height: 2.h,),
      Row(
        children: [
          Text(LocaleKeys.Date.tr(),style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              color: HexColor('#333333')
          ),),
          Spacer(),
          Text(date,style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              color: HexColor('#4CB8BA')
          ),),

        ],
      ),
      SizedBox(height: 3.h,),
      InkWell(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetailScreen(
           details: details,
        ))),
        child: Container(
          height: 5.h,
          width: 30.w,
          decoration: BoxDecoration(
              color: HexColor('#2D2D2D'),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
            child: Text(LocaleKeys.Order_Details.tr(),style: TextStyle(
                fontSize:  10.sp,
                fontFamily: 'OpenSans',
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),),
          ),
        ),
      ),
    ],
  ),
);