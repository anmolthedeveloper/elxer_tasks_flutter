import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/task.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  CreateTaskCubit() : super(CreateTaskInitialState());

  void CreateTask({required TaskModel task}) async {}
}
