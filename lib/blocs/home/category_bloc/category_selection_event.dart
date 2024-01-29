// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_selection_bloc.dart';

// ignore: must_be_immutable
sealed class CategorySelectionEvent extends Equatable {
  int? index;
  CategorySelectionEvent({this.index});

  @override
  List<Object> get props => [index!];
}

// ignore: must_be_immutable
class PressBoxEvent extends CategorySelectionEvent {
  final int index;
  PressBoxEvent({
    required this.index,
  });
}
