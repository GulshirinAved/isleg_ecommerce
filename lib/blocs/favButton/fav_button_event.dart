part of 'fav_button_bloc.dart';

sealed class FavButtonEvent extends Equatable {
  final int id;

  const FavButtonEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class PressedEvent extends FavButtonEvent {
  const PressedEvent({required super.id});
}
