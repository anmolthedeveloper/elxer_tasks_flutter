import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../repository/taskRepository.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  late final TaskRepository taskRepo;
  CreateTaskCubit() : super(CreateTaskInitialState()) {
    taskRepo = TaskRepository();
  }

  void createTask({required TaskModel task, required String email}) async {
    try {
      emit(CreateTaskLoadingState());
      await taskRepo.addTask(task, email);
      emit(CreateTaskSuccessState());
    } catch (e) {
      debugPrint('Error while creating task: $e');
      emit(CreateTaskFailedState());
    }
  }
}
