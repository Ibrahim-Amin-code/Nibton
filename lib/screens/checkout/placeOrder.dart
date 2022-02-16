import 'package:flutter/material.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/components/constants.dart';
import 'package:nibton_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nibton_app/screens/layout/cubit/cubit.dart';
import 'package:nibton_app/screens/my_orders/orderDetail/componnent/constant.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

import 'address/userAddresses.dart';
import 'componnent/placeOrderConstant.dart';

// ignore: use_key_in_widget_constructors
class PlaceOrder extends StatefulWidget {
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (AppCubit.get(context).selectedItem != null)? selectAddressCardStatic(
                fullName: UserAddress.name,
                addressTitle: UserAddress.addressTitle,
                state: UserAddress.state,
                city: UserAddress.city,
                addressId: UserAddress.addressId,
                context: context) : Container(),
            spaceH(15),
            Text(
              LocaleKeys.Your_Orders.tr() + '( ${HomeCubit.get(context).cart.length.toString()} )',
              style: headingStyle.copyWith(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold),
            ),
            spaceH(15),
            ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) => orderItemCard(
                  price: HomeCubit.get(context).cart[index]['price'].toString(),
                  image: HomeCubit.get(context).cart[index]['cover_img'].toString(),
                  context: context,
                  name: HomeCubit.get(context).cart[index]['name'].toString(),
                  Qty:HomeCubit.get(context).cart[index]['quantity'].toString()
                ),
                separatorBuilder: (context, index) => spaceH(10),
                itemCount: HomeCubit.get(context).cart.length),
            spaceH(15),
            paymentDetail(),
            spaceH(15),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: deliverTime(),
            ),
            spaceH(15),

          ],
        ),
      ),
    );
  }
}
