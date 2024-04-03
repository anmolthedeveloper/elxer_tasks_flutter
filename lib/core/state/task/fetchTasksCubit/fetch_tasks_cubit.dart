import 'package:bloc/bloc.dart';
import 'package:elxer_tasks/core/state/task/repository/taskRepository.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';

part 'fetch_tasks_state.dart';

class FetchTasksCubit extends Cubit<FetchTasksState> {
  late final TaskRepository taskRepo;
  late List<TaskModel> tasks;
  late List<TaskModel> doneTasks;
  final String email;
  FetchTasksCubit({required this.email}) : super(FetchTasksInitialState()) {
    taskRepo = TaskRepository();
    fetchTasks();
  }

  void fetchTasks() async {
    try {
      emit(FetchTasksLoadingState());
      var tasks = await taskRepo.fetchTasksForEmail(email);
      emit(FetchTasksSuccessState(tasks: tasks));
    } catch (e) {
      debugPrint('Error while creating task: $e');
      emit(FetchTasksFailedState());
    }
  }
}
