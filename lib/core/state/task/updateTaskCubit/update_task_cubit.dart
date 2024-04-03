import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../repository/taskRepository.dart';

part 'update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  late final TaskRepository taskRepo;
  UpdateTaskCubit() : super(UpdateTaskInitialState()) {
    taskRepo = TaskRepository();
  }

  void updateTask({required String email, required TaskModel task}) async {
    try {
      emit(UpdateTaskLoadingState());
      await taskRepo.updateTaskForEmail(email, task);
      emit(UpdateTaskSuccessState());
    } catch (e) {
      debugPrint('Error while updating task: $e');
      emit(UpdateTaskFailedState());
    }
  }
}
