import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        add(NotSignedInUserEvent());
        return;
      } else {
        add(SignedInUserEvent(user: user));
      }

      debugPrint(
          'User is signed in! AuthStateChangeListener through Oauth google');
      debugPrint(user.toString());
    });
    on<SignedInUserEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NotSignedInUserEvent>((event, emit) {
      emit(NotSignedInUserState());
    });
  }
}
