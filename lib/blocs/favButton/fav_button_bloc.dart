import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isleg_ecommerce/data/models/favItem_model.dart';

part 'fav_button_event.dart';
part 'fav_button_state.dart';

class FavButtonBloc extends Bloc<FavButtonEvent, FavButtonState> {
  List updatedList = [];
  FavButtonBloc() : super(FavButtonInitial(favList: [])) {
    on<RemoveEvent>((event, emit) {
      updatedList = List.from(state.favList)..remove(event.item);
      emit(
        SuccessState(
          favList: updatedList,
        ),
      );
    });
    on<AddEvent>((event, emit) {
      updatedList = List.from(state.favList)..add(event.item);
      emit(
        SuccessState(
          favList: updatedList,
        ),
      );
    });
  }
}
