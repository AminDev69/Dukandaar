part of 'item_bloc.dart';

@immutable
abstract class ItemEvent {
  const ItemEvent();
}

class GetItemEvent extends ItemEvent {
  const GetItemEvent();
}
