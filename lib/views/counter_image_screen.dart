import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/img_bloc.dart';

class CounterImageScreen extends StatelessWidget {
  const CounterImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Image Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            width: 430,
            child: BlocBuilder<ImageBloc, ImageState>(
              builder: (context, state) {
                if (state is ImageLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is ImageLoadedState) {
                  return Image.network(
                    state.img,
                    frameBuilder:
                        (context, image, frame, wasSynchronouslyLoaded) {
                      if (frame == null) {
                        return const CircularProgressIndicator();
                      } else {
                        return image;
                      }
                    },
                    fit: BoxFit.fill,
                  );
                } else {
                  return const Text("ERROR");
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ImageBloc>(context).add(ImageLoadEvent());
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
