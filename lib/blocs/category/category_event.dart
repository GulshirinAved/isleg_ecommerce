// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryInitialEvent extends CategoryEvent {
  final List<bool> categoryList;
  const CategoryInitialEvent({required this.categoryList});
  @override
  List<Object> get props => [categoryList];
}

class CategoryExpandEvent extends CategoryEvent {
  final List<bool> categoryList;
  late bool isExpanded;
  late int index;
  CategoryExpandEvent(
      {required this.isExpanded,
      required this.index,
      required this.categoryList});
}
