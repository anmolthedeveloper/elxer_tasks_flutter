import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:elxer_tasks/pages/createTask/createTaskPage.dart';
import 'package:elxer_tasks/pages/signin/signinPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/state/user/user_bloc.dart';
import '../../core/theme/colors.dart';
import '../../core/widgets/customBottomNavigationBar/customBottomNavigationBar.dart';
import '../home/homePage.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  List<TabItem> items = const [
    TabItem(
      icon: Icons.home,
      // title: 'Home',
    ),
    TabItem(
      icon: Icons.bar_chart,
    ),
    TabItem(
      icon: Icons.add,
    ),
    TabItem(
      icon: Icons.shopping_cart_outlined,
    ),
    TabItem(
      icon: Icons.account_circle,
    ),
  ];

  int onPage = 0;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

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
            body: IndexedStack(
              index: onPage,
              children: const [
                HomePage(),
              ],
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              onChange: (index) {
                debugPrint('INDEX: $index');
                setState(() {
                  onPage = index;
                });
              },
              onPlusTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CreateTaskPage(),
                  ),
                );
              },
            ),
          );
        } else {
          return Scaffold(body: Container());
        }
      },
    );
  }
}
