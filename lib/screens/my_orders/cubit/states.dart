abstract class OrderState{}

class OrderInitialState extends OrderState{}
class OrderLoadingState extends OrderState{}
class OrderSuccessState extends OrderState{}
class OrderErrorState extends OrderState{
  final String error;
  OrderErrorState(this.error);
}

class SendOrderLoadingState extends OrderState{}
class SendOrderSuccessState extends OrderState{}
class SendOrderErrorState extends OrderState{
  final String error;
  SendOrderErrorState(this.error);
}

