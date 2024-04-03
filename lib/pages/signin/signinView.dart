import 'dart:async';

import 'package:elxer_tasks/pages/dashboard/dashboardPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../core/state/user/user_bloc.dart';
import '../../core/utils/google_sign_in.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool _isFading = false;
  bool _isSlide = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _isFading = true;
        _isSlide = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is SignedInUserState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const DashboardPage(),
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: AnimatedSlide(
            offset: _isSlide ? const Offset(0.0, 0.0) : const Offset(0.0, 0.5),
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: AnimatedOpacity(
              opacity: _isFading ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: 75,
                  ),
                  const Gap(10.0),
                  SignInButton(
                    Buttons.googleDark,
                    text: "Sign in with Google",
                    onPressed: () {
                      signInWithGoogle();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
