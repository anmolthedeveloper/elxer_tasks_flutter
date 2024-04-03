import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/state/task/deleteTaskCubit/delete_task_cubit.dart';
import 'homeView.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteTaskCubit(),
      lazy: false,
      child: const HomeView(),
    );
  }
}
