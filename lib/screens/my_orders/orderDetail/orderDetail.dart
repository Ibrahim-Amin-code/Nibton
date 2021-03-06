import 'package:flutter/material.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/components/constants.dart';
import 'package:sizer/sizer.dart';
import 'componnent/body.dart';
import 'package:easy_localization/easy_localization.dart';


// ignore: use_key_in_widget_constructors
class OrderDetailScreen extends StatelessWidget {
  final dynamic details;

  const OrderDetailScreen({Key? key,required this.details}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F5F6F8"),
      appBar:  PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height*0.7),
          child: Container(
            // color: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.06,vertical: MediaQuery.of(context).size.height*0.04),
            child: Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  InkWell(
                      onTap: ()=>Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios,color: HexColor('#4CB8BA'),size: 30,)),
                  SizedBox(width: 3.w,),
                  Text(LocaleKeys.Order_Details.tr(),style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: HexColor('#515C6F'),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ),)),
      body: OrderDetailBody(details: details,),
    );
  }
}
