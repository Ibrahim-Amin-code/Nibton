import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibton_app/models/login_model.dart';
import 'package:nibton_app/network/cache/cache_helper.dart';
import 'package:nibton_app/network/dio/dio_helper.dart';
import 'package:nibton_app/network/end_points.dart';
// import 'package:nibton_app/screens/Authnitication/login_cubit/states.dart';
import 'package:nibton_app/screens/Authnitication/sign_in/login_cubit/states.dart';
import 'package:nibton_app/screens/layout/layout_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel = LoginModel();

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      data: {
        'email': email,
        'password': password,
        "device_token": 'fwfwfrw',
      },
      url: Login,
    ).then((value) async {

      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.saveData(value: loginModel.data!.token ,key: 'token');
      CacheHelper.saveData(value: loginModel.data!.name ,key: 'username');
      CacheHelper.saveData(value: loginModel.data!.id.toString() ,key: 'userID');
      print(
          '========================================================= ${loginModel.msg}=');
      print(
          '========================================================= ${loginModel.data!.token}=');

      emit(LoginSuccessState());
    }).catchError((error) {
      print(email.toString());
      print(password.toString());
      emit(LoginErrorState(error.toString()));
      print(
          'error----------------------------------------------${error.toString()}');
    });
  }
}
