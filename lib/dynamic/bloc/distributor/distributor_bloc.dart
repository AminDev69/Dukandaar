import 'package:bloc/bloc.dart';
import 'package:dukandaar/dynamic/models/distributor_model.dart';
// import 'package:dukandaar/dynamic/models/order_model.dart';
import 'package:dukandaar/dynamic/repositories/distributor_repository.dart';
import 'package:meta/meta.dart';

part 'distributor_event.dart';
part 'distributor_state.dart';

class DistributorBloc extends Bloc<DistributorEvent, DistributorState> {
  DistributorBloc() : super(DistributorInitial());
  DistributorRepository distributorRepository = DistributorRepository();
  @override
  Stream<DistributorState> mapEventToState(DistributorEvent event) async* {
    if (event is GetAllDistributorEvent) {
      try {
        yield DistributorLoading();
        List<DistributorModel> distributor =
            await distributorRepository.getAllDistributor();
        yield DistributorLoaded(distributor);
      } on Exception {
        yield DistributorFailure("Unable to get Network error");
      }
    }
  }
}
