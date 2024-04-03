import 'package:elxer_tasks/core/state/task/fetchTasksCubit/fetch_tasks_cubit.dart';
import 'package:elxer_tasks/pages/dashboard/dashbaordView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/state/user/user_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FetchTasksCubit(email: context.read<UserBloc>().user!.email!),
      lazy: false,
      child: const DashboardView(),
    );
  }
}
