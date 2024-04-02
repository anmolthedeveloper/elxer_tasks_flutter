import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../core/state/app/user_bloc.dart';
import '../../core/theme/colors.dart';
import '../signin/signinPage.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
            backgroundColor: secondaryOffWhiteColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    const Gap(20.0),
                    Text(
                      'Welcome ${state.user.displayName?.split(' ')[0] ?? 'User'}',
                      style: theme.textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
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
