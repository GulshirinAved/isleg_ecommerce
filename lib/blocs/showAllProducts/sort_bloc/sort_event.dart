part of 'sort_bloc.dart';

sealed class SortEvent extends Equatable {
  const SortEvent();

  @override
  List<Object> get props => [];
}

final class SortPressEvent extends SortEvent {
  final String pressedTitle;

  const SortPressEvent({required this.pressedTitle});
}
