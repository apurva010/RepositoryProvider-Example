import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_example/repository/api_repo.dart';

import '../model/sample_model.dart';

abstract class SampleDataEvent {}

class SampleDataInitialEvent extends SampleDataEvent {}

class SampleDataLoadEvent extends SampleDataEvent {}

abstract class SampleDataState {}

class SampleDataLoadingState extends SampleDataState {}

class SampleDataLoadedState extends SampleDataState {
  final List<SampleModel> sampleData;
  SampleDataLoadedState(this.sampleData);
}

class ErrorState extends SampleDataState {}

class SampleDataBloc extends Bloc<SampleDataEvent, SampleDataState> {
  final ApiRepo apiRepo = ApiRepo();

  SampleDataBloc() : super(SampleDataLoadingState()) {
    on<SampleDataInitialEvent>((event, emit) {
      emit(SampleDataLoadingState());
    });
    on<SampleDataLoadEvent>((event, emit) async {
      try {
        final data = await apiRepo.getData();
        emit(SampleDataLoadedState(data));
      } catch (e) {
        emit(ErrorState());
      }
    });
  }
}
