import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_example/bloc/sample_data_bloc.dart';

class SampleDataScreen extends StatelessWidget {
  const SampleDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sample Data Screen",
        ),
      ),
      body: BlocBuilder<SampleDataBloc, SampleDataState>(
        builder: (context, state) {
          if (state is SampleDataLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is SampleDataLoadedState) {
            return ListView.builder(
              itemCount: state.sampleData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.sampleData[index].title.toString()),
                  leading: Text(state.sampleData[index].id.toString()),
                  trailing:
                      Text(state.sampleData[index].isCompleted.toString()),
                );
              },
            );
          } else {
            return const Text("ERROR");
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<SampleDataBloc>(context).add(SampleDataLoadEvent());
        },
        child: const Icon(
          Icons.get_app,
        ),
      ),
    );
  }
}
