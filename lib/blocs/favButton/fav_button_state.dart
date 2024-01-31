part of 'fav_button_bloc.dart';

sealed class FavButtonState extends Equatable {
  final List favList;
  final bool isFav;

  const FavButtonState({required this.favList, required this.isFav});

  @override
  List<Object> get props => [favList, isFav];
}

final class FavButtonInitial extends FavButtonState {
  const FavButtonInitial({required super.favList, required super.isFav});
}

final class SuccessState extends FavButtonState {
  const SuccessState({required super.favList, required super.isFav});
}
