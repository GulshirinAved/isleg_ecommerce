part of 'get_header_bloc.dart';

sealed class GetHeaderEvent extends Equatable {
  const GetHeaderEvent();

  @override
  List<Object> get props => [];
}
class GetHeaderList extends GetHeaderEvent{}