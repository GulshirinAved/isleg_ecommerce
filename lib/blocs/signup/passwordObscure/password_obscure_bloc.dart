import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_obscure_event.dart';
part 'password_obscure_state.dart';

class PasswordObscureBloc
    extends Bloc<PasswordObscureEvent, PasswordObscureState> {
  PasswordObscureBloc()
      : super(PasswordObscureInitial(isObscure: false, isObscure1: false)) {
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(isObscure: !state.isObscure));
    });
    on<PasswordConfirmEvent>((event, emit) {
      emit(state.copyWith(isObscure1: !state.isObscure1));
    });
  }
}
