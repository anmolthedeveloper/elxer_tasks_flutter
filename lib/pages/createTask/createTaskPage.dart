import 'package:elxer_tasks/pages/createTask/createTaskView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/state/task/createTaskCubit/create_task_cubit.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTaskCubit(),
      child: CreateTaskView(email: email),
    );
  }
}
