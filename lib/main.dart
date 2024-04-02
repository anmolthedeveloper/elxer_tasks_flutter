import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/state/app/globalBlocObserver.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = GlobalBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FirebaseAuth.instance.authStateChanges().listen((User? user) async {
  //   if (user == null) {
  //     debugPrint('User is currently signed out!');
  //     // add(SignOutUserEvent());
  //     // return;
  //   } else {
  //     // add(GoogleSignInUserEvent(googleUser: user));
  //     debugPrint('WOOHOO! User is currently signed in!');
  //   }
  //
  //   debugPrint(
  //       'User is signed in! AuthStateChangeListener through Oauth google');
  //   debugPrint(user.toString());
  // });

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}
