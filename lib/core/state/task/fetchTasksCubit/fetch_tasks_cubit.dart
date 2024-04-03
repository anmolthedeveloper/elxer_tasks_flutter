import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_tasks_state.dart';

class FetchTasksCubit extends Cubit<FetchTasksState> {
  FetchTasksCubit() : super(FetchTasksInitial());
}
