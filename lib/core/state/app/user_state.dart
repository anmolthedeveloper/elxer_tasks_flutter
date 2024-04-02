part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {}

class SignedInUserState extends UserState {
  final User user;
  SignedInUserState({required this.user});
}

class SignInUserState extends UserState {}

class NotSignedInUserState extends UserState {}

class SignOutUserState extends UserState {}
