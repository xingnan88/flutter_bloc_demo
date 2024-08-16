import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class UserEvent extends Equatable {
  const UserEvent();
}

final class UserStarted extends UserEvent {
  const UserStarted();
  @override
  List<Object> get props => [];
}