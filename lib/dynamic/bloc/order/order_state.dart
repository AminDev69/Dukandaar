part of 'order_bloc.dart';

@immutable
abstract class OrderState {
  const OrderState();
}

class OrderInitial extends OrderState {
  const OrderInitial();
}

class OrderLoading extends OrderState {
  const OrderLoading();
}

class OrderLoaded extends OrderState {
  final OrderModel orderModel;
  const OrderLoaded(this.orderModel);
}

class OrderFailure extends OrderState {
  final String error;
  const OrderFailure(this.error);
}
