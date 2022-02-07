import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/screens/cart/componnent/constant.dart';
import 'package:nibton_app/screens/checkout/checkout_cubit/checkout_cubit.dart';
import 'package:nibton_app/screens/checkout/checkout_cubit/states.dart';
import 'package:nibton_app/screens/components/constants.dart';
import 'package:nibton_app/screens/editAddress/editAddress.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';


// ignore: use_key_in_widget_constructors
class UserAddress extends StatefulWidget {
  @override
  _UserAddressState createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit,CheckoutState>(
      listener: (context,state){},
      builder: (context,state){
        return SingleChildScrollView(
          child: Column(
            children: [
              ConditionalBuilder(
                condition: state is! CheckoutLoadingState,
                builder: (context)=> ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        addressCard(
                          addressId: CheckoutCubit.get(context).getAddressModel.data![index].id.toString(),
                            addressTitle : CheckoutCubit.get(context).getAddressModel.data![index].addressName.toString(),
                            city:  CheckoutCubit.get(context).getAddressModel.data![index].city.toString(),
                            fullName:  CheckoutCubit.get(context).getAddressModel.data![index].fullName.toString(),
                            state:   CheckoutCubit.get(context).getAddressModel.data![index].state.toString()
                        ),
                    separatorBuilder: (context, index) => spaceH(10),
                    itemCount: CheckoutCubit.get(context).getAddressModel.data!.length),
                fallback: (context)=>Center(child: CircularProgressIndicator()),
                // child: ,
              ),
              spaceH(15),
              placeOrderButton(
                  context: context, title: LocaleKeys.PROCEED.tr(), press: () {})
            ],
          ),
        );
      },
    );
  }
  addressCard({
    required String fullName,
    required String addressTitle,
    required String state,
    required String city,
    required String addressId,
}) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                addressTitle,
                style: headingStyle.copyWith(
                    color: HexColor("#4CB8BA"),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600),
              ),
              Radio(
                  activeColor: HexColor("#4CB8BA"),
                  value: "",
                  groupValue: "",
                  onChanged: (value) {})
            ],
          ),
          Text(fullName,
            style: headingStyle.copyWith(
                color: HexColor("#515C6F"),
                fontSize: 13.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 0.5.h,),
          Text(
            city,
            style: headingStyle.copyWith(
                color: HexColor("#515C6F").withOpacity(0.5),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 1.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state,
                style: headingStyle.copyWith(
                    color: HexColor("#4CB8BA"),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditAddressScreen(id: addressId,)));
                      CheckoutCubit.get(context).getAddresses();

                    },
                    child: Container(
                      width: 15.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            HexColor("#FF9000"),
                            HexColor("#FFBE03")
                          ]),
                          boxShadow: [
                            BoxShadow(
                                color: HexColor("#B5994565").withOpacity(0.2),
                                offset: const Offset(0, 3),
                                spreadRadius: 3,
                                blurRadius: 3)
                          ],
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(LocaleKeys.EDIT.tr(),
                            style: headingStyle.copyWith(
                              color: HexColor("#272727"),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                  ),
                  spaceW(10),
                  InkWell(
                    onTap: () {
                      CheckoutCubit.get(context).deleteAddress(addressId: addressId);
                      CheckoutCubit.get(context).getAddresses();
                    },
                    child: Container(
                      width: 18.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: HexColor("#2D2D2D"),
                          boxShadow: [
                            BoxShadow(
                                color: HexColor("#B5994565").withOpacity(0.1),
                                offset: const Offset(0, 3),
                                spreadRadius: 3,
                                blurRadius: 3)
                          ],
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(LocaleKeys.DELETE.tr(),
                            style: headingStyle.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
