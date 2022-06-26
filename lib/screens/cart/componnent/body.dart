import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/checkout/checkout.dart';
import 'package:nibton_app/screens/components/constants.dart';
import 'package:nibton_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nibton_app/screens/home/home_cubit/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nibton_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:nibton_app/screens/my_orders/cubit/states.dart';

import 'constant.dart';

import 'package:sizer/sizer.dart';

// ignore: use_key_in_widget_constructors
class CartBody extends StatefulWidget {
  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetCartErrorState) {
          Center(
              child: Text(
            'No Data Found',
            style: TextStyle(
              color: Colors.red,
              fontSize: 15.sp,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
            ),
          ));
        }
        if (state is SendOrderSuccessState) {
          HomeCubit.get(context).cart.clear();
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! GetCartLoadingState,
          builder: (context) => (HomeCubit.get(context).cart.isNotEmpty)
              ? ListView(
                  primary: true,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                  children: [
                    ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return cartItemCard(
                            id: HomeCubit.get(context).cart[index]['id'],
                            image: HomeCubit.get(context)
                                .cart[index]['cover_img']
                                .toString(),
                            name: HomeCubit.get(context)
                                .cart[index]['name']
                                .toString(),
                            price: HomeCubit.get(context)
                                .cart[index]['price']
                                .toString(),
                            quantity: HomeCubit.get(context)
                                .cart[index]['counter']
                                .toString(),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 2.h,
                            ),
                        itemCount: HomeCubit.get(context).cart.length),
                    spaceH(20),
                    optionCard(),
                    spaceH(20),
                    placeOrderButton(
                        context: context,
                        title: "PLACE THIS ORDER SR 1100.00",
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutScren())))
                  ],
                )
              : Center(
                  child: Text(
                  'No Products Here... Please Add Some Product',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  cartItemCard({
    required String image,
    required String name,
    required dynamic price,
    required String quantity,
    required int id,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: HexColor("#E7EAF0"),
                offset: const Offset(0, 3),
                spreadRadius: 3,
                blurRadius: 3)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30.w,
            height: 16.h,
            child: customCachedNetworkImage(
                url: image, context: context, fit: BoxFit.contain),
          ),
          SizedBox(
            width: 1.w,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: headingStyle.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#515C6F")),
                  ),
                ),
                Text(
                  "SAR  $price",
                  style: headingStyle.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: HexColor("#4CB8BA")),
                ),
                SizedBox(
                  height: 2.h,
                ),
                // countRow(id: id),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Quantity: ',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                  TextSpan(
                    text: quantity,
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ]))
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.clear,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget countRow({
  //   required int id,
  // }) =>
  //     BlocBuilder<AppCubit, AppStates>(
  //       // listener: (context, state) {},
  //       builder: (context, state) {
  //         return Row(
  //           children: [
  //             InkWell(
  //                 onTap: () {
  //                   AppCubit.get(context).decreaseQuantity(
  //                     productId: id,
  //                   );
  //                   print(id);
  //                 },
  //                 child: Container(
  //                   width: 8.w,
  //                   height: 4.h,
  //                   padding: const EdgeInsets.only(bottom: 50),
  //                   decoration: BoxDecoration(
  //                       shape: BoxShape.circle, color: HexColor("#5A5A5A")),
  //                   child: Icon(
  //                     Icons.minimize,
  //                     color: Colors.white,
  //                     size: 20,
  //                   ),
  //                 )),
  //             SizedBox(
  //               width: 3.w,
  //             ),
  //             (AppCubit.get(context).counter[id] != null ||
  //                     AppCubit.get(context).counter[id] == 0)
  //                 ? Text(
  //                     "${AppCubit.get(context).counter[id]}",
  //                     style: headingStyle.copyWith(
  //                         fontSize: 13.sp,
  //                         fontWeight: FontWeight.w600,
  //                         color: HexColor("#515C6F")),
  //                   )
  //                 : Text(
  //                     (AppCubit.get(context).counter[id] != null)
  //                         ? AppCubit.get(context).counter[id].toString()
  //                         : "1",
  //                     style: headingStyle.copyWith(
  //                         fontSize: 13.sp,
  //                         fontWeight: FontWeight.w600,
  //                         color: HexColor("#515C6F")),
  //                   ),
  //             SizedBox(
  //               width: 3.w,
  //             ),
  //             InkWell(
  //                 onTap: () {
  //                   AppCubit.get(context).increaseQuantity(
  //                     productId: id,
  //                   );
  //                   print(id);
  //                 },
  //                 child: Container(
  //                   width: 8.w,
  //                   height: 4.h,
  //                   // padding: const EdgeInsets.only(bottom: 30),
  //                   decoration: BoxDecoration(
  //                       shape: BoxShape.circle, color: HexColor("#5A5A5A")),
  //                   child: Icon(
  //                     Icons.add,
  //                     color: Colors.white,
  //                     size: 20,
  //                   ),
  //                 )),
  //           ],
  //         );
  //       },
  //     );

}
