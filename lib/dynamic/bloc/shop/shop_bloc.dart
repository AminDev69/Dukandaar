import 'package:bloc/bloc.dart';
import 'package:dukandaar/dynamic/models/shop_model.dart';
import 'package:dukandaar/dynamic/repositories/shop_repository.dart';
import 'package:meta/meta.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(ShopInitial());
  ShopRepository shopRepository = ShopRepository();
  @override
  Stream<ShopState> mapEventToState(ShopEvent event) async* {
    if (event is PostShopEvent) {
      try {
        yield ShopLoading();
        ShopModel shopModel =
            await shopRepository.postshop(event.shopModel, event.userId);
        yield ShopLoaded(shopModel);
      } on Exception {
        yield ShopFailure("Unable to get Network error");
      }
    } else if (event is PutShopEvent) {
      try {
        yield ShopLoading();
        ShopModel shopModel = await shopRepository.updateshop(event.shopModel);
        yield ShopLoaded(shopModel);
      } on Exception {
        yield ShopFailure("unable to get network error");
      }
    }
  }
}
