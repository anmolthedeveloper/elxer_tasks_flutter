part of 'update_task_cubit.dart';

@immutable
abstract class UpdateTaskState {}

class UpdateTaskInitialState extends UpdateTaskState {}

class UpdateTaskLoadingState extends UpdateTaskState {}

class UpdateTaskSuccessState extends UpdateTaskState {}

class UpdateTaskFailedState extends UpdateTaskState {}
