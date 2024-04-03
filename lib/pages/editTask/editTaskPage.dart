import 'package:elxer_tasks/pages/editTask/editTaskView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/state/task/models/task.dart';
import '../../core/state/task/updateTaskCubit/update_task_cubit.dart';

class EditTaskPage extends StatelessWidget {
  const EditTaskPage({super.key, required this.email, required this.task});
  final String email;
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateTaskCubit(),
      child: EditTaskView(
        email: email,
        task: task,
      ),
    );
  }
}
