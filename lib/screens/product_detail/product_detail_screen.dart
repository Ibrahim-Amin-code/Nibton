import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/cart/cart.dart';
import 'package:nibton_app/screens/home/home_component/home_component.dart';
import 'package:nibton_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:nibton_app/screens/product_detail/product_detail_component/product_description.dart';
import 'package:nibton_app/screens/product_detail/product_detail_component/product_detail_component.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductDetailsScreen extends StatefulWidget {
  final dynamic details;

  ProductDetailsScreen({Key? key, required this.details}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      HexColor('#000000'),
      HexColor('#B5994565'),
      HexColor('#727C8E'),
      HexColor('#ED5199'),
      HexColor('#515C6F'),
      HexColor('#FF8C69'),
      HexColor('#4CB8BA'),
      HexColor('#FF9000')
    ];

    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('#F5F6F8'),
        leading: Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: HexColor('#4CB8BA'),
                size: 25,
              )),
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen())),
            child: Padding(
              padding: EdgeInsets.only(right: 5.w, top: 2.h, left: 5.w),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/cart-home.png',
                    color: HexColor('#727C8E'),
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.h, right: 1.w),
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor: HexColor('#4CB8BA'),
                      child: Center(
                        child: Text(
                          '7',
                          style: TextStyle(fontSize: 8, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
        ),
        primary: true,
        shrinkWrap: true,
        children: [
          (widget.details.productImage.isNotEmpty)
              ? CarouselSlider.builder(
                  itemCount: widget.details.productImage.length,
                  itemBuilder: (context, index, pageViewIndex) {
                    return Container(
                      child: customCachedNetworkImage(
                          url: widget.details.productImage[index].image,
                          context: context,
                          fit: BoxFit.contain),
                    );
                  },
                  options: CarouselOptions(
                    height: 250,
                    initialPage: 0,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    aspectRatio: 3,
                  ),
                )
              : Container(),

          SizedBox(
            height: 3.h,
          ),
          Text(
            widget.details.name,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: HexColor('#515C6F'),
                fontFamily: 'OpenSan'),
          ),
          SizedBox(
            height: 1.h,
          ),
          buildRatingBarRow(context: context, id: widget.details.id.toString()),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.Brands.tr() + ':',
                style: TextStyle(
                  fontSize: 16,
                  color: HexColor('#515C6F'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Casio',
                style: TextStyle(
                  fontSize: 16,
                  color: HexColor('#4CB8BA'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            LocaleKeys.Model_Number.tr() + ': ${widget.details.modalNumber}',
            //quantity
            style: TextStyle(
              fontSize: 16,
              color: HexColor('#515C6F'),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.Availability.tr() + ':',
                style: TextStyle(
                  fontSize: 16,
                  color: HexColor('#515C6F'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.details.quantity.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: HexColor('#4CB8BA'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          buildAddToCartRow(
              context: context,
              price: widget.details.price.toString(),
              id: widget.details.id.toString()),
          //id: HomeCubit.get(context).getProductsModel.data![index].id.toString()
          SizedBox(
            height: 2.h,
          ),
          buildAddToWishListRow(
              context: context, id: widget.details.id.toString()),
          SizedBox(
            height: 4.h,
          ),
          Text(
            LocaleKeys.Select_Color.tr(),
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              color: HexColor('#515C6F'),
              fontSize: 10.sp,
            ),
          ),
          SizedBox(height: 2.h,),
          (widget.details.color != null) ? Container(
                  height: 10.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor(
                          widget.details.color[index].toString(),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 15,
                    ),
                    itemCount: (widget.details.color.length),
                  ),
                ) : Container(),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'اختر الحجم',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              color: HexColor('#515C6F'),
              fontSize: 10.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 5.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                // height: 7.h,
                width: 11.w,
                child: Text(widget.details.size![index].toString()),
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
              itemCount: (widget.details.size.length),
            ),
          ),
          SizedBox(
              height: 45.h,
              child: ProductDescription(
                description: widget.details.description,
              )),
          Row(
            children: [
              Text(
                'Similer Products',
                style: TextStyle(
                    color: HexColor('#515C6F'),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    fontSize: 12.sp),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: HexColor('#515C6F'),
                    size: 15,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: HexColor('#515C6F'),
                    size: 15,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(
            height: 41.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                primary: true,
                shrinkWrap: true,
                itemBuilder: (context, index) => buildNationalDayProductsItem(
                    image: 'assets/images/Image 32.png',
                    context: context,
                    name: ''),
                separatorBuilder: (context, index) => SizedBox(
                      width: 2.w,
                    ),
                itemCount: 5),
          ),
          SizedBox(
            height: 3.h,
          ),
          buildSeeAllButton(),
          SizedBox(
            height: 3.h,
          ),
        ],
      ),
    );
  }
}
