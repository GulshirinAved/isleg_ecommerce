import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isleg_ecommerce/data/models/cart_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial(cartList: const [])) {
    List updatedList = [];
    on<AddCartEvent>((event, emit) {
      List<CartItem> updatedList = List.from(state.cartList)
        ..add(event.cartItem!);
      emit(CartSuccess(cartList: updatedList));
    });
    on<RemoveCartEvent>((event, emit) {
      final updatedList = List<CartItem>.from(state.cartList);
      final index =
          updatedList.indexWhere((item) => item.id == event.cartItem!.id);
      updatedList.removeAt(index);
      emit(CartSuccess(cartList: updatedList));
    });
    on<RemoveCartAllEvent>((event, emit) {
      List updatedList = [];

      emit(CartInitial(
        cartList: updatedList,
      ));
    });
    on<PlusButtonEvent>((event, emit) {
      final updatedList = List.from(state.cartList);
      final index =
          updatedList.indexWhere((item) => item.id == event.cartItem!.id);
      updatedList[index] =
          event.cartItem!.copyWith(quantity: updatedList[index].quantity + 1);
      emit(
        CartSuccess(
          cartList: updatedList,
        ),
      );
    });
    on<MinusButtonEvent>((event, emit) {
      final updatedList = List<CartItem>.from(state.cartList);
      final index =
          updatedList.indexWhere((item) => item.id == event.cartItem!.id);
      if (index != -1) {
        if (updatedList[index].quantity > 1) {
          updatedList[index] = event.cartItem!
              .copyWith(quantity: updatedList[index].quantity - 1);
        } else {
          updatedList.removeAt(index);
        }
      }
      emit(CartSuccess(cartList: updatedList));
    });
    on<SumProductEvent>((event, emit) {
      final updatedList = List<CartItem>.from(state.cartList);
      double priceOfProducts = 0;

      for (int i = 0; i < updatedList.length; i++) {
        priceOfProducts +=
            double.parse(updatedList[i].price) * updatedList[i].quantity;
      }
      emit(
        SumProductState(
          sum: priceOfProducts,
          cartList: state.cartList,
          sumDelivery: 15 + priceOfProducts,
        ),
      );
    });
  }
}
