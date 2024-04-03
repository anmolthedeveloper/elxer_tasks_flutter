import 'package:bloc/bloc.dart';
import 'package:elxer_tasks/core/state/user/repository/userRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    var userRepo = UserRepository();
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        add(NotSignedInUserEvent());
        return;
      } else {
        try {
          bool userExists = await userRepo.doesEmailExist(user.email!);
          if (!userExists) {
            await userRepo.addUser(user.displayName!, user.email!);
          }
          add(SignedInUserEvent(user: user));
        } catch (e) {
          debugPrint('Error establishing connection with $e');
        }
      }
    });
    on<SignedInUserEvent>((event, emit) {
      emit(SignedInUserState(user: event.user));
    });
    on<NotSignedInUserEvent>((event, emit) {
      emit(NotSignedInUserState());
    });
  }
}
