import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_example/repository/repo.dart';

abstract class ImageEvent {}

class InitialEvent extends ImageEvent {}

class LoadEvent extends ImageEvent {}

abstract class ImageState {}

class LoadingState extends ImageState {}

class LoadedState extends ImageState {
  final String img;
  LoadedState(this.img);
}

class ErrorState extends ImageState {}

class BlocRepo extends Bloc<ImageEvent, ImageState> {
  final ImageRepository imageRepository = ImageRepository();

  BlocRepo() : super(LoadingState()) {
    on<InitialEvent>((event, emit) {
      emit(LoadingState());
    });
    on<LoadEvent>((event, emit) {
      try {
        final img = imageRepository.getImage();
        emit(LoadedState(img));
      } catch (e) {
        emit(ErrorState());
      }
    });
  }
}
