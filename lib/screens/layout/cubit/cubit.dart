import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibton_app/screens/categories/categories_screen.dart';
import 'package:nibton_app/screens/home/home_screen.dart';
import 'package:nibton_app/screens/layout/cubit/states.dart';
import 'package:nibton_app/screens/more/more_screen.dart';
import 'package:nibton_app/screens/my_orders/my_orders_screen.dart';
import 'package:nibton_app/screens/offers/offers_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  int? selectedItem;

  void addressSelection({int? selected}) {
    selectedItem = selected;
    emit(SelectionAddressState());
  }

  List<Widget> screens = [
    CategoriesScreen(),
    OffersScreen(),
    HomeScreen(),
    MyOrdersScreen(),
    MoreScreen(),
  ];

  // List<String> titles = [
  //   'Categories',
  //   'Offers',
  //   'Home',
  //   'My Orders',
  //   'More',
  // ];
  // LoginModel loginModel = LoginModel();

  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }
  // bool isDark = false;
  // void changeAppMode({bool? fromShard}){
  //   if(fromShard != null) isDark = fromShard; else isDark = !isDark;
  //   CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value){
  //     emit(AppChangeModeState());
  //   });
  // }

}
