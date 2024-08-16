import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo/features/user/bloc/user_event.dart';
import 'package:flutter_bloc_demo/features/user/bloc/user_state.dart';
import 'package:flutter_bloc_demo/features/user/data/repositories/user_repositories.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.userRepositories) : super(const UserLoading()) {
    on<UserStarted>(_onUserStarted);
  }

  final UserRepositories userRepositories;

  Future<void> _onUserStarted(
      UserStarted event, Emitter<UserState> emit) async {
    emit(const UserLoading());
    try {
      final users = await userRepositories.getUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(const UserError());
    }
  }
}
