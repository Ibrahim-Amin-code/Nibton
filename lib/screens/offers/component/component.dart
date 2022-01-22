import 'package:flutter/widgets.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/models/all_offers.dart';
import 'package:nibton_app/screens/components/constants.dart';
import 'package:nibton_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';

Widget buildOffersCard({
  required String price,
  required String newPrice,
  required String image,
  context,
})=>  Container(
  height: 105,
  color: HexColor('#FFFFFF'),
  child: Row(
    children: [
      Container(
        color: HexColor('#4CB8BA'),
        child: Padding(
          padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.Sale_Off.tr(),style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: HexColor('#FFFFFF'),
                  fontFamily: 'OpenSans'
              ),),
              SizedBox( height: 10,),
              Text('${LocaleKeys.Price.tr()}:  $price | ${LocaleKeys.New_Price.tr()}: $newPrice   ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#FFFFFF'),
                    fontFamily: 'OpenSans',
                ),),
              SizedBox( height: 10,),
              Text(LocaleKeys.All_Products.tr(),style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: HexColor('#FFFFFF'),
                  fontFamily: 'OpenSans'

              ),), // SizedBox( height: 5,),
            ],
          ),
        ),
      ),
      Spacer(),
      Container(
        width: 150,
        child:
        customCachedNetworkImage(url: image,context: context, fit: BoxFit.contain,),
      ),
    ],
  ),
);

Widget buildOffersCardRow({
  required String price,
  required String newPrice,
  required String image,
  required String title,
  context,
})=>  Container(
  decoration: BoxDecoration(
    color:HexColor('#4CB8BA'),

  ),
  width: 150,
  child: Stack(
    children: [
      Container(
        height: 22.h,
        // width: 50.w,
        child: customCachedNetworkImage(url: image, context: context, fit: BoxFit.cover),
      ),
        Padding(
          padding:  EdgeInsets.only(top: 23.h,left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(
                color: HexColor('FFFFFF'),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'OpenSans'
              ),),
              SizedBox(height: 5,),
              Text('${LocaleKeys.Price.tr()}:  ' + price,style: TextStyle(
                  color: HexColor('FFFFFF'),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans'
              ),),
              SizedBox(height: 5,),
              Text('${LocaleKeys.New_Price.tr()}:  ' + newPrice,style: TextStyle(
                  color: HexColor('FFFFFF'),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans'
              ),),
              SizedBox(height: 5,),
            ],
          ),
        )
    ],
  ),
);