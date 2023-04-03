import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_example/model/user_model.dart';

import '../repository/user_repo.dart';

abstract class UserEvent {}

class UserInitialEvent extends UserEvent {}

class UserLoadEvent extends UserEvent {}

abstract class UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<UserModel> users;
  UserLoadedState(this.users);
}

class ErrorState extends UserState {}

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo = UserRepo();

  UserBloc() : super(UserLoadingState()) {
    on<UserInitialEvent>((event, emit) {
      emit(UserLoadingState());
    });
    on<UserLoadEvent>((event, emit) async {
      try {
        final user = await userRepo.getUsers();
        emit(UserLoadedState(user));
      } catch (e) {
        emit(ErrorState());
      }
    });
  }
}
