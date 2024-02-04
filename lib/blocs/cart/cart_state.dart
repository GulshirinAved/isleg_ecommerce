part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  final List cartList;
  double? sum;
  double? sumDelivery;

  CartState({required this.cartList, this.sum, this.sumDelivery});

  @override
  List<Object> get props => [
        cartList,
      ];
}

final class CartInitial extends CartState {
  CartInitial({
    required super.cartList,
  });
  @override
  List<Object> get props => [
        cartList,
      ];
}

final class CartSuccess extends CartState {
  CartSuccess({required super.cartList});

  @override
  List<Object> get props => [cartList];
}

final class SumProductState extends CartState {
  SumProductState(
      {required super.cartList,
      required super.sum,
      required super.sumDelivery});

  @override
  List<Object> get props => [cartList, sum!, sumDelivery!];
}
