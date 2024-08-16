import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/features/user/data/models/user_model.dart';

@immutable
sealed class UserState extends Equatable {
  const UserState();
}

final class UserLoading extends UserState {
  const UserLoading();
  @override
  List<Object> get props => [];
}

final class UserLoaded extends UserState {
  const UserLoaded(this.users);

  final List<UserModel> users;

  @override
  List<Object> get props => [];
}

final class UserError extends UserState {
  const UserError();
  @override
  List<Object> get props => [];
}