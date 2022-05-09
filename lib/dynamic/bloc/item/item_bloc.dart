import 'package:bloc/bloc.dart';
import 'package:dukandaar/dynamic/models/item_model.dart';
import 'package:dukandaar/dynamic/repositories/item_repository.dart';
import 'package:meta/meta.dart';
part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial());
  ItemRepository itemRepository = ItemRepository();
  @override
  // GetAll
  Stream<ItemState> mapEventToState(ItemEvent event) async* {
    if (event is GetItemEvent) {
      try {
        yield ItemLoading();

        List<ItemModel> item = await itemRepository.getAllItems();
        yield ItemLoaded(item);
      } on Exception {
        yield ItemFailure("Unable to get Network error");
      }
    }
  }
}
