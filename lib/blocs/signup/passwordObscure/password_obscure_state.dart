// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'password_obscure_bloc.dart';

class PasswordObscureState extends Equatable {
  bool isObscure;
  bool isObscure1;

  PasswordObscureState({this.isObscure = false, this.isObscure1 = false});

  @override
  List<Object> get props => [isObscure, isObscure1];

  PasswordObscureState copyWith({
    bool? isObscure,
    bool? isObscure1,
  }) {
    return PasswordObscureState(
      isObscure: isObscure ?? this.isObscure,
      isObscure1: isObscure1 ?? this.isObscure1,
    );
  }
}

final class PasswordObscureInitial extends PasswordObscureState {
  PasswordObscureInitial({required super.isObscure, required super.isObscure1});
}

final class PasswordObscureSuccess extends PasswordObscureState {
  PasswordObscureSuccess({required super.isObscure});
}

final class PasswordObscure1Success extends PasswordObscureState {
  PasswordObscure1Success({required super.isObscure1});
}
