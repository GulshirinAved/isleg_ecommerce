part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryExpandingState extends CategoryState {
  final List<bool>? isOpen;
  const CategoryExpandingState({this.isOpen});
  @override
  List<Object> get props => [isOpen!];
}

final class CategoryExpandedState extends CategoryState {
  final bool isOpened;
  const CategoryExpandedState({required this.isOpened});
  @override
  List<Object> get props => [isOpened];
}
