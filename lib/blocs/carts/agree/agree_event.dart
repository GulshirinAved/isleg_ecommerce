part of 'agree_bloc.dart';

sealed class AgreeEvent extends Equatable {
  final bool value;
  const AgreeEvent({required this.value});

  @override
  List<Object> get props => [value];
}

class ChangeAgreeEvent extends AgreeEvent {
  const ChangeAgreeEvent({required super.value});
}
