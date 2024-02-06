part of 'signin_agree_bloc.dart';

sealed class SigninAgreeState extends Equatable {
  final bool value;

  const SigninAgreeState({required this.value});

  @override
  List<Object> get props => [value];
}

final class SigninAgreeInitial extends SigninAgreeState {
  SigninAgreeInitial({required super.value});
}

final class SigninAgreeSuccess extends SigninAgreeState {
  const SigninAgreeSuccess({required super.value});
}
