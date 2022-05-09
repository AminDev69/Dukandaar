import 'package:bloc/bloc.dart';
import 'package:dukandaar/dynamic/models/order_model.dart';
import 'package:dukandaar/dynamic/repositories/order_repository.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial());
  OrderRepository orderRepository = OrderRepository();
  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is CancelOrderEvent) {
      try {
        yield OrderLoading();
        await orderRepository.cancelOrder((event.id));
        OrderModel order = await orderRepository.cancelOrder(event.id);
        yield OrderLoaded(order);
      } on Exception {
        yield OrderFailure("unable to get network error");
      }
    }
  }
}
