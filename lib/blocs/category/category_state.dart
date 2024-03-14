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
