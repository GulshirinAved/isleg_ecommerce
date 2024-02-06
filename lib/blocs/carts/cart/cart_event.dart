part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  CartItem? cartItem;

  CartEvent({required this.cartItem});

  @override
  List<Object> get props => [cartItem!];
}

final class AddCartEvent extends CartEvent {
  AddCartEvent({
    required super.cartItem,
  });
  @override
  List<Object> get props => [cartItem!];
}

final class RemoveCartEvent extends CartEvent {
  RemoveCartEvent({
    required super.cartItem,
  });
  @override
  List<Object> get props => [cartItem!];
}

final class RemoveCartAllEvent extends CartEvent {
  RemoveCartAllEvent({
    required super.cartItem,
  });
  @override
  List<Object> get props => [cartItem!];
}

final class PlusButtonEvent extends CartEvent {
  PlusButtonEvent({
    required super.cartItem,
  });
  @override
  List<Object> get props => [cartItem!];
}

final class MinusButtonEvent extends CartEvent {
  MinusButtonEvent({
    required super.cartItem,
  });
  @override
  List<Object> get props => [cartItem!];
}

final class SumProductEvent extends CartEvent {
  SumProductEvent({required super.cartItem});
}
