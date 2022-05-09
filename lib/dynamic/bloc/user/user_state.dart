part of 'user_bloc.dart';

@immutable
abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final UserModel userModel;
  const UserLoaded(this.userModel);
}

class UserFailure extends UserState {
  final String error;
  const UserFailure(this.error);
}
