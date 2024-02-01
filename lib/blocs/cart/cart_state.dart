part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  final List cartList;

  const CartState({required this.cartList});

  @override
  List<Object> get props => [cartList];
}

final class CartInitial extends CartState {
  const CartInitial({required super.cartList});
}

final class CartSuccess extends CartState {
  const CartSuccess({required super.cartList});
}
