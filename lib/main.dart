import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/features/user/bloc/user_bloc.dart';
import 'package:flutter_bloc_demo/features/user/bloc/user_event.dart';
import 'package:flutter_bloc_demo/features/user/data/repositories/user_repositories.dart';
import 'package:flutter_bloc_demo/features/user/presentation/screens/user_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserBloc(UserRepositories())..add(const UserStarted()),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UserScreen(),
      ),
    );
  }
}
