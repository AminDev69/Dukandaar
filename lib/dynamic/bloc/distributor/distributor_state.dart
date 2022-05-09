part of 'distributor_bloc.dart';

@immutable
abstract class DistributorState {
  const DistributorState();
}

class DistributorInitial extends DistributorState {
  const DistributorInitial();
}

class DistributorLoading extends DistributorState {
  const DistributorLoading();
}

class DistributorLoaded extends DistributorState {
  final List<DistributorModel> distributorList;
  const DistributorLoaded(this.distributorList);
}

class DistributorFailure extends DistributorState {
  final String error;
  const DistributorFailure(this.error);
}
