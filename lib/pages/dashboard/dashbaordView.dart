import 'package:elxer_tasks/core/state/task/fetchTasksCubit/fetch_tasks_cubit.dart';
import 'package:elxer_tasks/pages/createTask/createTaskPage.dart';
import 'package:elxer_tasks/pages/signin/signinPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/ui/widgets/customBottomNavigationBar/customBottomNavigationBar.dart';
import '../../core/state/user/user_bloc.dart';
import '../../core/theme/colors.dart';
import '../home/homePage.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
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
                Center(
                  child: Text('Stats'),
                ),
                Center(
                  child: Text('Calender'),
                ),
                Center(
                  child: Text('Settings'),
                ),
              ],
            ),
            floatingActionButton: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CreateTaskPage(
                      email: state.user.email!,
                    ),
                  ),
                ).then((value) => context.read<FetchTasksCubit>().fetchTasks());
              },
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  color: primaryGreenThemeColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: primaryWhiteColor,
                  size: 30,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: CustomBottomNavigationBar(
              onChange: (index) {
                debugPrint('INDEX: $index');
                setState(() {
                  onPage = index;
                });
              },
              onPlusTap: () {},
            ),
          );
        } else {
          return Scaffold(body: Container());
        }
      },
    );
  }
}
