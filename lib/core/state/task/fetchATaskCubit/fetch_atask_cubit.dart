import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_atask_state.dart';

class FetchAtaskCubit extends Cubit<FetchAtaskState> {
  FetchAtaskCubit() : super(FetchAtaskInitial());
}
