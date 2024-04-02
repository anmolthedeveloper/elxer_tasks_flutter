import 'package:elxer_tasks/pages/signin/signinPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/state/app/user_bloc.dart';
import '../../core/theme/colors.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is NotSignedInUserState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const SignInPage(),
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is SignedInUserState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryGreenThemeColor,
              title: const Text('Elxer Tasks'),
            ),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hello',
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(body: Container());
        }
      },
    );
  }
}
