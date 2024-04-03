import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../repository/taskRepository.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  late final TaskRepository taskRepo;
  DeleteTaskCubit() : super(DeleteTaskInitialState()) {
    taskRepo = TaskRepository();
  }

  void deleteTask({required String taskId, required String email}) async {
    try {
      emit(DeleteTaskLoadingState());
      await taskRepo.deleteTaskForEmail(taskId, email);
      emit(DeleteTaskSuccessState());
    } catch (e) {
      debugPrint('Error while creating task: $e');
      emit(DeleteTaskFailedState());
    }
  }
}
