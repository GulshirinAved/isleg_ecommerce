part of 'get_header_bloc.dart';

sealed class GetHeaderState extends Equatable {
  const GetHeaderState();

  @override
  List<Object> get props => [];
}

final class GetHeaderInitial extends GetHeaderState {}

final class GetHeaderLoading extends GetHeaderState {}

final class GetHeaderLoaded extends GetHeaderState {
  final List<dynamic> getHeaderList;
  const GetHeaderLoaded({required this.getHeaderList});
}

final class GetHeaderError extends GetHeaderState {
  final String? error;

  const GetHeaderError({required this.error});
}
