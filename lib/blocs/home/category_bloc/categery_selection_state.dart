import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CategorySelectionState extends Equatable {
  int stateIndex;

  CategorySelectionState({this.stateIndex = -1});

  @override
  List<Object?> get props => [stateIndex];

  CategorySelectionState copyWith({
    int? stateIndex,
  }) {
    return CategorySelectionState(
      stateIndex: stateIndex ?? this.stateIndex,
    );
  }
}
