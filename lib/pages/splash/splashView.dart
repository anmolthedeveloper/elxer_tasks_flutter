import 'dart:async';

import 'package:animate_gradient/animate_gradient.dart';
import 'package:elxer_tasks/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/state/user/user_bloc.dart';
import '../dashboard/dashboardPage.dart';
import '../signin/signinPage.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          Timer(const Duration(milliseconds: 4000), () {
            if (state is NotSignedInUserState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const SignInPage(),
                ),
                (Route<dynamic> route) => false,
              );
              return;
            }

            if (state is SignedInUserState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const DashboardPage(),
                ),
                (Route<dynamic> route) => false,
              );
              return;
            }
          });
        },
        child: AnimateGradient(
          duration: const Duration(seconds: 3),
          primaryBegin: Alignment.topLeft,
          primaryEnd: Alignment.bottomLeft,
          secondaryBegin: Alignment.bottomLeft,
          secondaryEnd: Alignment.topRight,
          primaryColors: const [
            primaryGreenThemeColor,
            primaryWhiteColor,
          ],
          secondaryColors: const [
            primaryWhiteColor,
            primaryGreenThemeColor,
          ],
          child: Center(
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              height: 75,
            ),
          ),
        ),
      ),
    );
  }
}
