part of 'signin_agree_bloc.dart';

sealed class SigninAgreeEvent extends Equatable {
  final bool value;

  const SigninAgreeEvent({required this.value});

  @override
  List<Object> get props => [value];
}

class ChangeSigninAgreeEvent extends SigninAgreeEvent {
  const ChangeSigninAgreeEvent({required super.value});
}
