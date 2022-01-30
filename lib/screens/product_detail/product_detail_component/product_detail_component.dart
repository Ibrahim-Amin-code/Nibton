
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/Review/review.dart';
import 'package:nibton_app/screens/Review/write%20review/write_review.dart';
import 'package:nibton_app/screens/cart/cart.dart';
import 'package:nibton_app/screens/home/home_component/home_component.dart';
import 'package:nibton_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:nibton_app/screens/menu_screens/wish_list/wish_list_screen.dart';
import 'package:easy_localization/easy_localization.dart';

Widget buildAddToCartAndWishListContainer({
  required String title,
}) => Container(
      height: 5.h,
      width: 50.w,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
              colors: [HexColor('#FF9000'), HexColor('#FFBE03')])),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: HexColor('#272727'),
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              fontSize: 11.sp,
            ),
          ),
          Spacer(),
          CircleAvatar(
              radius: 13,
              backgroundColor: HexColor('#000000'),
              child: Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: HexColor('#FFBE03'),
                  size: 12,
                ),
              )),
        ],
      ),
    );

Widget buildAddToWishListRow({
  context,
  required String id,}) =>
    Row(
      children: [
        CircleAvatar(
          backgroundColor: HexColor('#5A5A5A'),
          radius: 20,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Icon(
              Icons.minimize,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          '01',
          style: TextStyle(
            fontSize: 22,
            color: HexColor('#6A6A69'),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        CircleAvatar(
          backgroundColor: HexColor('#5A5A5A'),
          radius: 20,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        Spacer(),
        InkWell(
            onTap: (){
              HomeCubit.get(context).addToWishList(id: id);
            },
            child: buildAddToCartAndWishListContainer(title: LocaleKeys.ADD_WISH.tr(),)),
      ],
    );

Widget buildAddToCartRow({context, required String price,required String id,}) => Row(
      children: [
        Text(
          //Availability: In Stock
          price,
          style: TextStyle(
            fontSize: 11.sp,
            color: HexColor('#4CB8BA'),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          '|',
          style: TextStyle(
            fontSize: 14,
            color: HexColor('#C9C9C9'),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          'SAR 300',
          style: TextStyle(
            color: HexColor('#C9C9C9'),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            fontSize: 11.sp,
            decoration: TextDecoration.lineThrough,
            decorationStyle: TextDecorationStyle.double,
            decorationColor: HexColor('C9C9C9'),
          ),
        ),
        Spacer(),
        InkWell(
            onTap: () {
              HomeCubit.get(context).addToCart(id: id);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: buildAddToCartAndWishListContainer(
              title: LocaleKeys.ADD_CART.tr(),
            )),
      ],
    );

Widget buildSeeAllButton() => Container(
      // margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
              colors: [HexColor('#FF9000'), HexColor('#FFBE03')])),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 40.w),
            child: Text(
              LocaleKeys.See_All.tr(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'OpenSans',
                fontSize: 12.sp,
              ),
            ),
          ),
          Spacer(),
          CircleAvatar(
              radius: 13,
              backgroundColor: HexColor('#000000'),
              child: Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: HexColor('#FFBE03'),
                  size: 12,
                ),
              )),
        ],
      ),
    );




Widget buildRatingBarRow({context,required String id,}) => Row(
      children: [
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 23,
          // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        InkWell(
          onTap: (){
            HomeCubit.get(context).getReviews(id: id);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewScreen(id: id,)),);
          },
          child: Text(
            '1 ${LocaleKeys.Review.tr()} ',
            style: TextStyle(
              fontSize: 10.sp,
              color: HexColor('#C9C9C9'),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        InkWell(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>WriteReviewScreen(iD: id,)),),
          child: Text(
            '| ${LocaleKeys.Write_Review.tr()}',
            style: TextStyle(
              fontSize: 10.sp,
              color: HexColor('#C9C9C9'),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
