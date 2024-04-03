part of 'fetch_tasks_cubit.dart';

@immutable
abstract class FetchTasksState {}

class FetchTasksInitialState extends FetchTasksState {}

class FetchTasksLoadingState extends FetchTasksState {}

class FetchTasksSuccessState extends FetchTasksState {
  final List<TaskModel> tasks;
  FetchTasksSuccessState({required this.tasks});
}

class FetchTasksFailedState extends FetchTasksState {}
