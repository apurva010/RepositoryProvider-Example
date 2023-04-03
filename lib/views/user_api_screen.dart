import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_example/bloc/user_bloc.dart';

class UserApiScreen extends StatelessWidget {
  const UserApiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Api Screen",
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<UserBloc>(context).add(UserLoadEvent());
        },
        child: const Icon(
          Icons.get_app,
        ),
      ),
    );
  }
}
