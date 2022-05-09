part of 'shop_bloc.dart';

@immutable
abstract class ShopEvent {
  const ShopEvent();
}

class PostShopEvent extends ShopEvent {
  final ShopModel shopModel;
  final int userId;
  const PostShopEvent(this.shopModel, this.userId);
}

class PutShopEvent extends ShopEvent {
  final ShopModel shopModel;
  final int userId;
  const PutShopEvent(this.shopModel, this.userId);
}
