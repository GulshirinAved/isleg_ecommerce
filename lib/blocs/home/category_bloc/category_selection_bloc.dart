import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isleg_ecommerce/blocs/home/category_bloc/categery_selection_state.dart';

part 'category_selection_event.dart';

class CategorySelectionBloc
    extends Bloc<CategorySelectionEvent, CategorySelectionState> {
  CategorySelectionBloc() : super(CategorySelectionState()) {
    on<PressBoxEvent>((event, emit) {
      emit(state.copyWith(stateIndex: event.index));
    });
  }
}
