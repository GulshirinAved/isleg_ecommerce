import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'agree_event.dart';
part 'agree_state.dart';

class AgreeBloc extends Bloc<AgreeEvent, AgreeState> {
  AgreeBloc() : super(AgreeInitial(value: false)) {
    on<AgreeEvent>((event, emit) {
      emit(AgreeSuccess(value: event.value));
    });
  }
}
