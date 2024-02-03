part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  final CartItem cartItem;

  CartEvent({required this.cartItem});

  @override
  List<Object> get props => [cartItem];
}

final class AddEvent extends CartEvent {
  AddEvent({
    required super.cartItem,
  });
  @override
  // TODO: implement props
  List<Object> get props => [cartItem];
}

final class PlusButtonEvent extends CartEvent {
  PlusButtonEvent({
    required super.cartItem,
  });
  @override
  // TODO: implement props
  List<Object> get props => [cartItem];
}

final class MinusButtonEvent extends CartEvent {
  MinusButtonEvent({
    required super.cartItem,
  });
  @override
  // TODO: implement props
  List<Object> get props => [cartItem];
}
