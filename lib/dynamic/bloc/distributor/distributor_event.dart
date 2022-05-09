part of 'distributor_bloc.dart';

@immutable
abstract class DistributorEvent {
  const DistributorEvent();
}

class GetAllDistributorEvent extends DistributorEvent {
  const GetAllDistributorEvent();
}
