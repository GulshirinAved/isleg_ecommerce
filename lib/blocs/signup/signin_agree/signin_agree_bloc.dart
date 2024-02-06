import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signin_agree_event.dart';
part 'signin_agree_state.dart';

class SigninAgreeBloc extends Bloc<SigninAgreeEvent, SigninAgreeState> {
  SigninAgreeBloc() : super(SigninAgreeInitial(value: false)) {
    on<ChangeSigninAgreeEvent>((event, emit) {
      emit(SigninAgreeSuccess(value: event.value));
    });
  }
}
