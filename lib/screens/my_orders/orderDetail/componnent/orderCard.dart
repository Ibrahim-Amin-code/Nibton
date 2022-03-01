import 'package:flutter/material.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/components/constants.dart';
import 'package:nibton_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';


orderCardDetail({
  required String orderNum,
  required String totalAmount,
  required String paymentMethod,
  required String itemsNum,
  required String orderStatus,
  required String date,
  List? price,

}){
  num totalPrice = 0;
  price!.forEach((element) {
    totalPrice += element.price * element.quantity;
  });
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: Colors.white),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Order.tr(),
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
            Text(
              orderNum,
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#4CB8BA")),
            ),
          ],
        ),
        SizedBox(height: 1.5.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Total_Amount.tr(),
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
            Text(
              '${totalPrice}',
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#4CB8BA")),
            ),
          ],
        ),
        SizedBox(height: 1.5.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Items.tr(),
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
            Text(
              itemsNum,
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#4CB8BA")),
            ),
          ],
        ),
        SizedBox(height: 1.5.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.PaymentMethod.tr(),
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
            Text(
              paymentMethod,
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#4CB8BA")),
            ),
          ],
        ),
        SizedBox(height: 1.5.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Order_Status.tr(),
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
            Text(
              orderStatus,
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#4CB8BA")),
            ),
          ],
        ),
        SizedBox(height: 1.5.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Date.tr(),
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
            Text(
              date,
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#4CB8BA")),
            ),
          ],
        ),
      ],
    ),
  );
}

/////////////////////////////////////////////////////////////////////////////////////////////

productOrderDetail({
  required String price,
  required String qty,
  required String productName,
  required context,
  required String image,
}) {
  return Container(
    padding:  EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: HexColor("#E7EAF0"),
              offset: const Offset(0, 3),
              spreadRadius: 3,
              blurRadius: 3)
        ]),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 100,
          height: 13.h,
          child: customCachedNetworkImage(url: image, context: context, fit: BoxFit.contain),
        ),
        SizedBox(width: 3.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(
              productName,
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: HexColor("#333333")),
            ),

            SizedBox(height: 1.5.h,),
            Text(
              "Price:  $price",
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: HexColor("#4CB8BA")),
            ),
            SizedBox(height: 1.5.h,),
            Text(
              "Qty:  $qty",
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5)),
            ),
          ],
        )
      ],
    ),
  );
}

///////////////////////////////////////////////////////////////////////////////////////

paymentDetail(List? price) {
  num totalPrice = 0;
  price!.forEach((element) {
    totalPrice += element.price * element.quantity;
  });

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: Colors.white),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Sub_Total.tr(),
                style: headingStyle.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#333333"))),
            Text(
              '$totalPrice',
              style: headingStyle.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#333333")),
            ),
          ],
        ),
        SizedBox(height: 1.h,),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Total_Tax.tr(),
                style: headingStyle.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#333333"))),
            Text(
              "SAR 30.00",
              style: headingStyle.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#333333")),
            ),
          ],
        ),
        SizedBox(height: 1.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Shipping.tr(),
                style: headingStyle.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#333333"))),
            Text(
              "SAR 15.00",
              style: headingStyle.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#333333")),
            ),
          ],
        ),
        SizedBox(height: 1.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.COD_Charge.tr(),
                style: headingStyle.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#333333"))),
            Text(
              "SAR 10.00",
              style: headingStyle.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#333333")),
            ),
          ],
        ),
        SizedBox(height: 1.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Amount_Paid.tr(),
                style: headingStyle.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#4CB8BA"))),
            Text(
              "SAR 355.00",
              style: headingStyle.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#4CB8BA")),
            ),
          ],
        ),
      ],
    ),
  );
}
