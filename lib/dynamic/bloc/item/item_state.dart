part of 'item_bloc.dart';

@immutable
abstract class ItemState {
  const ItemState();
}

class ItemInitial extends ItemState {
  const ItemInitial();
}

class ItemLoading extends ItemState {
  const ItemLoading();
}

class ItemLoaded extends ItemState {
  final List<ItemModel> itemModel;
  const ItemLoaded(this.itemModel);
}

class ItemFailure extends ItemState {
  final String error;
  const ItemFailure(this.error);
}
