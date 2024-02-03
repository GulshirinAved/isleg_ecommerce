part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  final List cartList;

  CartState({required this.cartList});

  @override
  List<Object> get props => [cartList];
}

final class CartInitial extends CartState {
  CartInitial({required super.cartList});
  @override
  // TODO: implement props
  List<Object> get props => [
        cartList,
      ];
}

final class CartSuccess extends CartState {
  CartSuccess({required super.cartList});
  @override
  // TODO: implement props
  List<Object> get props => [
        cartList,
      ];
}
