part of 'create_task_cubit.dart';

@immutable
abstract class CreateTaskState {}

class CreateTaskInitialState extends CreateTaskState {}

class CreateTaskLoadingState extends CreateTaskState {}

class CreateTaskSuccessState extends CreateTaskState {}

class CreateTaskFailedState extends CreateTaskState {}
