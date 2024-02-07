import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isleg_ecommerce/data/models/favItem_model.dart';

part 'fav_button_event.dart';
part 'fav_button_state.dart';

class FavButtonBloc extends Bloc<FavButtonEvent, FavButtonState> {
  List updatedFavList = [];
  FavButtonBloc() : super(const FavButtonInitial(favList: [])) {
    on<RemoveFavEvent>((event, emit) {
      updatedFavList = List.from(state.favList)..remove(event.item);
      emit(
        SuccessState(
          favList: updatedFavList,
        ),
      );
      print(updatedFavList);
    });
    on<AddFavEvent>((event, emit) {
      updatedFavList = List.from(state.favList)..add(event.item);
      emit(
        SuccessState(
          favList: updatedFavList,
        ),
      );
      print(updatedFavList);
    });
  }
}
