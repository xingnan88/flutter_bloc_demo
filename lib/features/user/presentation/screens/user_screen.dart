import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/user/bloc/user_bloc.dart';
import 'package:flutter_bloc_demo/features/user/bloc/user_state.dart';
import 'package:flutter_bloc_demo/features/user/presentation/widgets/user_body_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Bloc',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return switch (state) {
          UserLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          UserError() => const Center(
              child: Text('Failed to fetch users'),
            ),
          UserLoaded() => UserBodyWidget(users: state.users),
        };
      }),
    );
  }
}
