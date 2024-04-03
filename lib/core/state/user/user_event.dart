part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class SignInUserEvent extends UserEvent {}

class SignedInUserEvent extends UserEvent {
  final User user;

  SignedInUserEvent({required this.user});
}

class NotSignedInUserEvent extends UserEvent {}

class SignOutUserEvent extends UserEvent {}
