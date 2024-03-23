import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sort_event.dart';
part 'sort_state.dart';

class SortBloc extends Bloc<SortEvent, SortState> {
  SortBloc() : super(SortInitial(title: '')) {
    on<SortPressEvent>((event, emit) {
      emit(state.copyWith(title: event.pressedTitle));
    });
  }
}
