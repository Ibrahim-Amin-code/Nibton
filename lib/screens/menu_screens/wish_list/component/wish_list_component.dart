import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nibton_app/screens/home/home_component/home_component.dart';
import 'package:nibton_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nibton_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:nibton_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';


Widget buildWishListProductsItem({
  required String image,
  required String price,
  required String name,
  required String id,
  required context,
}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 15, color: Colors.black12)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height:19.h,
                // color: ,
                child: customCachedNetworkImage(url: image, context: context, fit: BoxFit.contain),
              ),
              Container(
                margin: EdgeInsets.only(top: 1.h),
                height: 3.h,
                width: 11.w,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [HexColor('#FF9000'), HexColor('#FFBE03')])),
                child: Center(
                  child: Text(
                    'NEW',
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                        color: HexColor('#272727')),
                  ),
                ),
              ),
            ],
          ),
          Text(
            name,
            style: TextStyle(
                color: HexColor('#515C6F'),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
                fontSize: 13.sp),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                width: 1.5.w,
              ),
              Text(
                '(4.5)',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: HexColor('#C9C9C9'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding:  EdgeInsets.only(right: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'price '+price,
                  style: TextStyle(
                      color: HexColor('#4CB8BA'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
                Text(
                  '|',
                  style: TextStyle(
                    color: HexColor('#C9C9C9'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'SAR 300',
                  style: TextStyle(
                    color: HexColor('#C9C9C9'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.double,
                    decorationColor: HexColor('C9C9C9'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.5.w),
            child: Row(
              children: [
                Image.asset('assets/images/interface.png'),
                Spacer(),
                Container(
                  width: 28.w,
                  height: 3.5.h,
                  padding: EdgeInsets.only(left: 1.5.w,right: 1.5.w),
                  color: HexColor('#2D2D2D'),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Cart.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSans',
                            color: HexColor('#FFFFFF')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
