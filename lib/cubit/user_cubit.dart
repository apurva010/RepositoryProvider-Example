import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_example/repository/user_repo.dart';

import '../model/user_model.dart';

abstract class UserDataState {}

class LoadingState extends UserDataState {}

class LoadedState extends UserDataState {
  final List<UserModel> data;
  LoadedState(this.data);
}

class ErrorState extends UserDataState {}

class UserCubit extends Cubit<UserDataState> {
  UserCubit() : super(LoadingState());

  final UserRepo userRepo = UserRepo();
  void getData() async {
    final data = await userRepo.getUsers();
    emit(LoadedState(data));
  }
}
