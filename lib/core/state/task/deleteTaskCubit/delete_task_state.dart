part of 'delete_task_cubit.dart';

@immutable
abstract class DeleteTaskState {}

class DeleteTaskInitialState extends DeleteTaskState {}

class DeleteTaskLoadingState extends DeleteTaskState {}

class DeleteTaskSuccessState extends DeleteTaskState {}

class DeleteTaskFailedState extends DeleteTaskState {}
