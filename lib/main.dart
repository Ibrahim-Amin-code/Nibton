import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibton_app/screens/Authnitication/forgetPassword/cubit/cubit.dart';
import 'package:nibton_app/screens/Authnitication/sign_in/login_cubit/cubit.dart';
import 'package:nibton_app/screens/Review/review.dart';
import 'package:nibton_app/screens/Review/write%20review/write_review.dart';
import 'package:nibton_app/screens/checkout/checkout_cubit/checkout_cubit.dart';
import 'package:nibton_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nibton_app/screens/layout/cubit/cubit.dart';
import 'package:nibton_app/screens/menu_screens/profile/get_profile_cubit/cubit.dart';
import 'package:nibton_app/screens/menu_screens/profile/update_profile_cubit/update_profle_cubit.dart';
import 'package:nibton_app/screens/splash/splashScreen.dart';
import 'package:sizer/sizer.dart';
import 'generated/codegen_loader.g.dart';
import 'network/bloc_observer.dart';
import 'network/dio/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.inti();


runApp(  EasyLocalization(
    supportedLocales: [Locale('en', ''), Locale('ar', '')],
    path: 'assets/translations', // <-- change the path of the translation files
    // fallbackLocale: Locale('en', ''),
    assetLoader: CodegenLoader(),
    child: MyApp(),));

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
            providers: [
              BlocProvider<AppCubit>(create: (context) => AppCubit()),
              BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
              BlocProvider<ForgetPasswordCubit>(create: (context) => ForgetPasswordCubit()),
              BlocProvider<UpdateProfileCubit>(create: (context) => UpdateProfileCubit()),
              BlocProvider<HomeCubit>(
                  create: (context) => HomeCubit()
                    ..getShops()
                    ..getCategories()
                    ..contactInfo()
                    ..getBanners()
                    ..getCard()
                    ..getProducts(id: '',brandId: '')
                    ..getWishList()
                    ..getAllOffers()
                    ..getReviews(id: '')),
              BlocProvider<CheckoutCubit>(create: (context) => CheckoutCubit()..getAddresses()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              home: SafeArea(
                child: Splash(),
              ),
            ));
      },
    );
  }
}
