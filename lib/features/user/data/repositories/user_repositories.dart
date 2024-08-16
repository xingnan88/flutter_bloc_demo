import 'package:flutter_bloc_demo/features/user/data/models/user_model.dart';
import 'package:flutter_bloc_demo/features/user/data/providers/user_providers.dart';

class UserRepositories {
  Future<List<UserModel>> getUsers() async {
    return await UserProviders().getUsers();
  }
}
