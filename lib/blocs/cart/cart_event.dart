part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  final CartItem cartItem;

  const CartEvent({required this.cartItem});

  @override
  List<Object> get props => [];
}

final class AddEvent extends CartEvent {
  const AddEvent({required super.cartItem});
}
