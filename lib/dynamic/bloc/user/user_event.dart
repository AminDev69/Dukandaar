part of 'user_bloc.dart';

@immutable
abstract class UserEvent {
  const UserEvent();
}

class GetUserEvent extends UserEvent {
  final int id;
  const GetUserEvent(this.id);
}

class PostUserEvent extends UserEvent {
  final UserModel userModel;
  const PostUserEvent(this.userModel);
}

class PutUserEvent extends UserEvent {
  final UserModel userModel;
  const PutUserEvent(this.userModel);
}
