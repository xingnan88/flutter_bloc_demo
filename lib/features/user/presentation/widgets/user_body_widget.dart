import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/features/user/data/models/user_model.dart';

class UserBodyWidget extends StatelessWidget {
  const UserBodyWidget({super.key, required this.users});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(user.username ?? '',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      decoration: TextDecoration.none)),
              Text(user.email ?? '',
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      decoration: TextDecoration.none)),
              Text(user.phone ?? '',
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.yellow,
                      decoration: TextDecoration.none)),
              Text(user.website ?? '',
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.purple,
                      decoration: TextDecoration.none)),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.white24,
                indent: 20,
                endIndent: 20,
              ),
            ],
          );
        });
  }
}
