import 'package:elxer_tasks/core/state/app/user_bloc.dart';
import 'package:elxer_tasks/pages/splash/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme();
    return BlocProvider(
      create: (context) => UserBloc(),
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Elxer Tasks',
        theme: theme.lightThemeData,
        home: const SplashPage(),
      ),
    );
  }
}
