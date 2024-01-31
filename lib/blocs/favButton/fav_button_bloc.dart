import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fav_button_event.dart';
part 'fav_button_state.dart';

class FavButtonBloc extends Bloc<FavButtonEvent, FavButtonState> {
  FavButtonBloc() : super(FavButtonInitial(favList: [], isFav: false)) {
    on<PressedEvent>((event, emit) {
      if (state.favList.contains(event.id)) {
        final updatedList = List.from(state.favList)..remove(event.id);

        emit(SuccessState(favList: updatedList, isFav: false));
      } else {
        final updatedList = List.from(state.favList)..add(event.id);

        emit(SuccessState(favList: updatedList, isFav: true));
      }
    });
  }
}
