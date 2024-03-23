part of 'sort_bloc.dart';

class SortState extends Equatable {
  final String title;

  SortState({required this.title});

  @override
  List<Object> get props => [title];
  SortState copyWith({String? title}) {
    return SortState(title: title ?? this.title);
  }
}

final class SortInitial extends SortState {
  SortInitial({required super.title});
}
