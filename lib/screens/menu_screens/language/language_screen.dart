
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nibton_app/generated/locale_keys.g.dart';
import 'package:nibton_app/network/cache/cache_helper.dart';
import 'package:nibton_app/screens/categories/categories_component/component.dart';
import 'package:nibton_app/screens/home/home_component/home_component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nibton_app/screens/layout/layout_screen.dart';
import 'package:sizer/sizer.dart';


class LanguageScreen extends StatefulWidget {


  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  @override
  Widget build(BuildContext context) {

    String value = "";

    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar:  PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height*0.7),
          child: Container(
            padding:  EdgeInsets.only(top: 8.h,left: 5.w,bottom: 2.h,right: 5.w),
            child: Row(
              children: [
                InkWell(
                    onTap: ()=>Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios,color: HexColor('#4CB8BA'),size: 25,)),
                SizedBox(width: 2.w,),
                Text(LocaleKeys.Select_Language.tr(),style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: HexColor('#515C6F'),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600
                ),),

              ],
            ),)),
      body: ListView(
        children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 20),
              child: Text(LocaleKeys.Preferred_Language.tr(),style: TextStyle(
              fontSize: 19,
              color: HexColor('#515C6F'),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold
          ),),
            ),
            SizedBox(
            height: 50,
          ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 20),
              child: Text(LocaleKeys.your_language.tr(),style: TextStyle(
                fontSize: 19,
                color: HexColor('#515C6F'),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold
          ),),
            ),
            SizedBox(
            height: 20,
            ),
            myDivider(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 40,top: 15),
              child: RadioListTile(
                value: 'اللغة العربية',
                groupValue: value,
                onChanged: (val) => setState((){
                  value = val.toString();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LayoutScreen(index: 2)), (route) => false);
                  // ignore: deprecated_member_use
                  context.locale = Locale("ar");
                  CacheHelper.saveData(key: 'lang', value: "ar");
                }),
                title: Text('اللغة العربية',style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#515C6F'),
                  fontFamily: 'OpenSans',
                ),),
              ),
            ),
            SizedBox(height: 5,),
            myDivider(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 40,top: 15),
              child: RadioListTile(
                value: 0,
                groupValue: value,
                onChanged: (val) => setState((){
                  value = val.toString();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LayoutScreen(index: 2)), (route) => false);
                  // ignore: deprecated_member_use
                  context.locale = Locale("en");
                  CacheHelper.saveData(key: 'lang', value: "en");
                }),
                title: Text('English Language',style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#515C6F'),
                  fontFamily: 'OpenSans',
                ),),
              ),
            ),
            SizedBox(height: 5,),
            myDivider(height: 2),
          //    SizedBox(height: 230,),
          //   Container(
          //   margin:  EdgeInsets.symmetric(horizontal: 15),
          //   height: 45,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(3),
          //       border: Border.all(color: HexColor('#FFBE03')),
          //       gradient: LinearGradient(
          //       colors: [HexColor('#FF9000'),HexColor('#FFBE03')])),
          //     child: Center(
          //       child: Text(LocaleKeys.Send.tr(),style: TextStyle(
          //         color: HexColor('#272727'),
          //         fontFamily: 'OpenSans',
          //         fontWeight: FontWeight.bold,
          //       ),),
          //     ),
          // ),


        ],
      ),
    );
  }
}
