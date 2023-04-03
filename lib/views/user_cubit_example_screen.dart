import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_example/cubit/user_cubit.dart';

class UserCubitExampleScreen extends StatelessWidget {
  const UserCubitExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cubit",
        ),
      ),
      body: BlocBuilder<UserCubit, UserDataState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const CircularProgressIndicator();
          } else if (state is LoadedState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.data[index].firstName.toString()),
                  subtitle: Text(state.data[index].email.toString()),
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(
                      state.data[index].avatar.toString(),
                    ),
                  ),
                  trailing: Text(state.data[index].id.toString()),
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
          BlocProvider.of<UserCubit>(context).getData();
        },
        child: const Icon(
          Icons.get_app,
        ),
      ),
    );
  }
}
