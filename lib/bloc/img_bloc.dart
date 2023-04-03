import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_example/repository/img_repo.dart';

abstract class ImageEvent {}

class ImageInitialEvent extends ImageEvent {}

class ImageLoadEvent extends ImageEvent {}

abstract class ImageState {
  int counter;
  ImageState(this.counter);
}

class ImageLoadingState extends ImageState {
  ImageLoadingState(super.counter);
}

class ImageLoadedState extends ImageState {
  final String img;
  final int num;
  ImageLoadedState(this.img, this.num) : super(num);
}

class ChangeImageState extends ImageState {
  ChangeImageState(super.counter);
}

class ImageErrorState extends ImageState {
  ImageErrorState(super.counter);
}

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository imageRepository = ImageRepository();

  ImageBloc() : super(ImageLoadingState(1)) {
    on<ImageInitialEvent>((event, emit) {
      emit(ImageLoadingState(1));
    });

    on<ImageLoadEvent>((event, emit) {
      try {
        print("STATE COUNTER VALUE ::: \n${state.counter} \n");
        final img = imageRepository.getImage((state.counter + 1).toString());
        emit(ImageLoadedState(img, state.counter + 1));
      } catch (e) {
        emit(ImageErrorState(1));
      }
    });
  }
}
