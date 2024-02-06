part of 'agree_bloc.dart';

sealed class AgreeState extends Equatable {
  final bool value;
  const AgreeState({required this.value});

  @override
  List<Object> get props => [value];
}

final class AgreeInitial extends AgreeState {
  const AgreeInitial({required super.value});
}

final class AgreeSuccess extends AgreeState {
  const AgreeSuccess({required super.value});
}
