import 'package:bloc/bloc.dart';
import 'package:dukandaar/dynamic/models/user_model.dart';
import 'package:dukandaar/dynamic/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());
  UserRepository userRepository = UserRepository();
  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is GetUserEvent) {
      try {
        yield UserLoading();
        UserModel user = await userRepository.getUser(event.id);
        yield UserLoaded(user);
      } on Exception {
        yield UserFailure("Unable to get Network error");
      }
    } else if (event is PostUserEvent) {
      try {
        yield UserLoading();
        UserModel user = await userRepository.postUser(event.userModel);
        yield UserLoaded(user);
      } on Exception {
        yield UserFailure("unable to get network error");
        // yield UserInitial();
      }
    } else if (event is PutUserEvent) {
      try {
        yield UserLoading();
        await userRepository.updateUser(event.userModel);
        yield UserLoaded(event.userModel);
      } on Exception {
        yield UserFailure("unable to get network error");
        yield UserInitial();
      }
    }
  }
}
