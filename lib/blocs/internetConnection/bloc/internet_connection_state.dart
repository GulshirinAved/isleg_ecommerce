part of 'internet_connection_bloc.dart';

sealed class InternetConnectionState extends Equatable {
  const InternetConnectionState();

  @override
  List<Object> get props => [];
}

final class InternetConnectionInitial extends InternetConnectionState {}

final class InternetConnectedState extends InternetConnectionState {
  final String internetState;

  const InternetConnectedState({required this.internetState});
  @override
  List<Object> get props => [internetState];
}

final class InternetNotConnectedState extends InternetConnectionState {
  final String internetState;
  const InternetNotConnectedState({required this.internetState});
  @override
  List<Object> get props => [internetState];
}
