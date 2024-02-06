part of 'fav_button_bloc.dart';

sealed class FavButtonEvent extends Equatable {
  final FavItem item;

  const FavButtonEvent({
    required this.item,
  });

  @override
  List<Object> get props => [item];
}

class AddFavEvent extends FavButtonEvent {
  const AddFavEvent({required super.item});
}

class RemoveFavEvent extends FavButtonEvent {
  const RemoveFavEvent({required super.item});
}
