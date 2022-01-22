
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/network/cache/cache_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibton_app/screens/cart/componnent/constant.dart';
import 'package:nibton_app/screens/components/constants.dart';
import 'package:nibton_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nibton_app/screens/home/home_cubit/states.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  @override
  _TermsAndConditionsScreenState createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  String lang = '';
  getLang()async{
    final String data = await CacheHelper.getData(key: 'lang');
    setState(() {
      lang = data;
    });
  }

  @override
  void initState() {
    this.getLang();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar:  PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height*0.7),
          child: Container(
            padding:  EdgeInsets.only(top: 8.h,left: 5.w,bottom: 3.h,right: 5.w),
            child: Row(
              children: [
                InkWell(
                    onTap: ()=>Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios,color: HexColor('#4CB8BA'),size: 25,)),
                SizedBox(width: 2.w,),
                Text(LocaleKeys.Terms_And_Conditions.tr(),
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: HexColor('#515C6F'),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600
                ),),
              ],
            ),)),
      body: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state){
          return ConditionalBuilder(
            condition: state is! ContactInfoLoadingState ,
            builder: (context)=> ListView(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              children: [
                SizedBox(height: 2.h,),
                Container(
                  // width: 340,
                  child:(lang == 'en')? Text(parseHtmlString(HomeCubit.get(context).contactModel.data!.termsEn,),
                    style: TextStyle(
                        height: 1.5,
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#7E7E7E'),
                        fontFamily: 'OpenSans'
                    ),
                  ): Text(parseHtmlString(HomeCubit.get(context).contactModel.data!.termsAr,),
                    style: TextStyle(
                        height: 1.5,
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#7E7E7E'),
                        fontFamily: 'OpenSans'
                    ),
                  ),
                ),
                // SizedBox(height: 10,),

              ],
            ),
            fallback: (context)=> Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
