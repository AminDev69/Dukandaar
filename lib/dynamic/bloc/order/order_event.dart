part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {
  const OrderEvent();
}

class CancelOrderEvent extends OrderEvent {
  final int id;
  const CancelOrderEvent(this.id);
}
