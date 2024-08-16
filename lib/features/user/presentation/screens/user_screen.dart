import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/user/bloc/user_bloc.dart';
import 'package:flutter_bloc_demo/features/user/bloc/user_state.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawerEnableOpenDragGesture: false,
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
          UserLoaded() => ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final username = state.users[index].username ?? '';
                final email = state.users[index].email ?? '';
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(username,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            decoration: TextDecoration.none)),
                    Text(email,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white60,
                            decoration: TextDecoration.none)),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.white54, indent: 20, endIndent: 20,),
                  ],
                );
              }),
        };
      }),
    );
  }
}
