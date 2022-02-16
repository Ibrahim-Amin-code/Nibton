import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibton_app/models/get_address_model.dart';
import 'package:nibton_app/models/get_order_model.dart';
import 'package:nibton_app/network/cache/cache_helper.dart';
import 'package:nibton_app/network/dio/dio_helper.dart';
import 'package:nibton_app/network/end_points.dart';
import 'package:nibton_app/screens/my_orders/cubit/states.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  GetOrderModel getOrderModel = GetOrderModel();

  void getOrders()async{
    emit(OrderLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    DioHelper.getData(
      url: GetOrder,
      token: 'Bearer $token',
    ).then((value) {
      getOrderModel = GetOrderModel.fromJson(value.data);
      print(value.data);
      emit(OrderSuccessState());
    }).catchError((error){
      print('error-----------------------------'+ error.toString());
      emit(OrderErrorState(error.toString()));
    });
  }

}
