part of 'shop_bloc.dart';

@immutable
abstract class ShopState {
  const ShopState();
}

class ShopInitial extends ShopState {
  const ShopInitial();
}

class ShopLoading extends ShopState {
  const ShopLoading();
}

class ShopLoaded extends ShopState {
  final ShopModel shopModel;
  const ShopLoaded(this.shopModel);
}

class ShopFailure extends ShopState {
  final String error;
  const ShopFailure(this.error);
}
