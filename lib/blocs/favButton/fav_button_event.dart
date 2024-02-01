part of 'fav_button_bloc.dart';

sealed class FavButtonEvent extends Equatable {
  final FavItem item;

  const FavButtonEvent({
    required this.item,
  });

  @override
  List<Object> get props => [item];
}

class AddEvent extends FavButtonEvent {
  const AddEvent({required super.item});
}

class RemoveEvent extends FavButtonEvent {
  const RemoveEvent({required super.item});
}
