import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial(cartList: [])) {
    List updatedList = [];
    on<AddEvent>((event, emit) {
      updatedList = List.from(state.cartList)..add(event.cartItem);
      emit(CartSuccess(cartList: updatedList));
    });
  }
}
