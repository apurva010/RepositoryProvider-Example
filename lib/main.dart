import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_example/bloc/img_bloc.dart';
import 'package:repository_example/views/counter_image_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return

        // Image Counter Example
        BlocProvider(
      create: (context) => ImageBloc()..add(ImageInitialEvent()),
      child: MaterialApp(
        title: 'Repository Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CounterImageScreen(),
      ),
    );

    //Cubit Example
    /*BlocProvider(
      create: (context) => UserCubit(),
      child: MaterialApp(
        title: 'Repository Provider with Cubit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UserCubitExampleScreen(),
      ),
    );*/

    // User Repository and Sample Data Repository (MultiRepositoryProvider or MultiRepositoryProvider)
    /*
        //MultiBlocProvider(
        MultiRepositoryProvider(
      providers: [
        BlocProvider(
          create: (context) => SampleDataBloc()..add(SampleDataInitialEvent()),
        ),
        BlocProvider(
          create: (context) => UserBloc()..add(UserInitialEvent()),
        )
      ],
      child: MaterialApp(
        title: 'Repository Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UserSampleDataScreen(),
      ),
    );*/

    // Sample Data Repository
    /* BlocProvider(
      create: (context) => SampleDataBloc()..add(SampleDataInitialEvent()),
      child: MaterialApp(
        title: 'Repository Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SampleDataScreen(),
      ),
    );*/

    // Simple Image Repository
    /*BlocProvider(
      create: (context) => BlocRepo()..add(InitialEvent()),
      child: MaterialApp(
        title: 'Repository Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );*/

    // User Data Repository
    /* BlocProvider(
      create: (context) => UserBloc()..add(UserInitialEvent()),
      child: MaterialApp(
        title: 'Repository Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UserApiScreen(),
      ),
    );*/
  }
}
