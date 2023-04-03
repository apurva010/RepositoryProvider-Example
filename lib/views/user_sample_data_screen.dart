import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_example/bloc/sample_data_bloc.dart';

import '../bloc/user_bloc.dart';

class UserSampleDataScreen extends StatelessWidget {
  const UserSampleDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Sample Data Screen",
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 350,
            child: BlocBuilder<SampleDataBloc, SampleDataState>(
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
                        trailing: Text(
                            state.sampleData[index].isCompleted.toString()),
                      );
                    },
                  );
                } else {
                  return const Text("ERROR");
                }
              },
            ),
          ),
          SizedBox(
            height: 350,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is UserLoadedState) {
                  return ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.users[index].firstName.toString()),
                        subtitle: Text(state.users[index].email.toString()),
                        leading: CircleAvatar(
                          foregroundImage: NetworkImage(
                            state.users[index].avatar.toString(),
                          ),
                        ),
                        trailing: Text(state.users[index].id.toString()),
                      );
                    },
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
          BlocProvider.of<SampleDataBloc>(context).add(SampleDataLoadEvent());
          BlocProvider.of<UserBloc>(context).add(UserLoadEvent());
        },
        child: const Icon(
          Icons.get_app,
        ),
      ),
    );
  }
}
