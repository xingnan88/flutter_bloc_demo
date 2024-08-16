import 'package:dio/dio.dart';
import 'package:flutter_bloc_demo/features/user/data/models/user_model.dart';

class UserProviders {
  static const url = 'https://jsonplaceholder.typicode.com/users';

  static const headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  final Dio _dio = Dio(BaseOptions(
      headers: headers,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
      sendTimeout: const Duration(seconds: 5)));

  Future<List<UserModel>> getUsers() async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      final List<UserModel> users = [];
      for (final user in response.data) {
        users.add(UserModel.fromJson(user));
      }
      return users;
    }
    return [];
  }
}
