import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_example/bloc/img_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Repository Example",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ImageBloc, ImageState>(
              builder: (context, state) {
                if (state is ImageLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is ImageLoadedState) {
                  return SizedBox(
                    height: 350,
                    width: 500,
                    child: Image.network(
                      state.img,
                      frameBuilder:
                          (context, image, frame, wasSynchronouslyLoaded) {
                        if (frame == null) {
                          return const CircularProgressIndicator();
                        } else {
                          return image;
                        }
                      },
                    ),
                  );
                } else {
                  return const Text("ERROR");
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<ImageBloc>(context).add(ImageLoadEvent());
              },
              child: const Text(
                "Get Image",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
