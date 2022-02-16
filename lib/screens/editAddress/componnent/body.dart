import 'package:flutter/material.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/cart/componnent/constant.dart';
import 'package:nibton_app/screens/checkout/checkout_cubit/checkout_cubit.dart';
import 'package:nibton_app/screens/components/constants.dart';
import 'package:nibton_app/screens/editAddress/editAddress.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';


// ignore: use_key_in_widget_constructors
class EditaddressBody extends StatefulWidget {
  final String id;

  const EditaddressBody({Key? key,required this.id}) : super(key: key);
  @override
  _EditaddressBodyState createState() => _EditaddressBodyState();
}

class _EditaddressBodyState extends State<EditaddressBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController addressTtile = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController detail = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 4.w),
      children: [
        Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                headerText(title: LocaleKeys.Address_Title.tr()),
                spaceH(10),
                customTextField(
                    title: LocaleKeys.Address_Title.tr(),
                    controller: addressTtile,
                    type: TextInputType.text,
                    secure: false),
                spaceH(10),
                headerText(title: LocaleKeys.Full_Name.tr()),
                spaceH(10),
                customTextField(
                    title: LocaleKeys.Full_Name.tr(),
                    controller: fullName,
                    type: TextInputType.name,
                    secure: false),
                spaceH(10),
                headerText(title: LocaleKeys.Email.tr()),
                spaceH(10),
                customTextField(
                    title: LocaleKeys.Email.tr(),
                    controller: email,
                    type: TextInputType.emailAddress,
                    secure: false),
                spaceH(10),
                headerText(title: LocaleKeys.Address_Location.tr()),
                spaceH(10),
                multilineTextField(
                    title: LocaleKeys.Address_Location.tr(),
                    controller: detail,
                    type: TextInputType.text,
                    secure: false),
                spaceH(10),
                headerText(title: LocaleKeys.District.tr()),
                spaceH(10),
                customTextField(
                    title: LocaleKeys.District.tr(),
                    controller: district,
                    type: TextInputType.text,
                    secure: false),
                spaceH(10),
                headerText(title: LocaleKeys.City.tr()),
                spaceH(10),
                customTextField(
                    title: LocaleKeys.City.tr(),
                    controller: city,
                    type: TextInputType.text,
                    secure: false),
                spaceH(10),
                headerText(title: LocaleKeys.Phone.tr()),
                spaceH(10),
                customTextField(
                    title: LocaleKeys.Phone.tr(),
                    controller: phoneNumber,
                    type: TextInputType.phone,
                    secure: false),
                spaceH(30),
                placeOrderButton(
                    context: context, title: LocaleKeys.Saved_Address.tr(), press: () {
                  CheckoutCubit.get(context).addAddress(
                      addressName: addressTtile.text.toString(),
                      addressId: widget.id.toString(),
                      fullAddress: detail.text.toString(),
                      fullName: fullName.text.toString(),
                      email: email.text.toString(),
                      phone: phoneNumber.text.toString(),
                      city: city.text.toString(),
                      state: district.text.toString());
                  CheckoutCubit.get(context).getAddresses();
                })
              ],
            ))
      ],
    );
  }
}
