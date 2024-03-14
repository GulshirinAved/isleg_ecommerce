import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryInitialEvent>((event, emit) {
      emit(CategoryExpandingState(isOpen: event.categoryList));
    });

    on<CategoryExpandEvent>((event, emit) {
      final updatedIsOpen = List<bool>.from(event.categoryList);
      updatedIsOpen[event.index] = !event.isExpanded;
      emit(CategoryExpandingState(isOpen: updatedIsOpen));
    });
  }
}
