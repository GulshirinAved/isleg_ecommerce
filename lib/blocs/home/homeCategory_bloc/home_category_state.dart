part of 'home_category_bloc.dart';

sealed class HomeCategoryState extends Equatable {
  const HomeCategoryState();

  @override
  List<Object> get props => [];
}

final class HomeCategoryInitial extends HomeCategoryState {}

final class HomeCategoryLoading extends HomeCategoryState {}

final class HomeCategoryLoaded extends HomeCategoryState {
  final List<dynamic> homeCategoryList;

  const HomeCategoryLoaded({required this.homeCategoryList});
}

final class HomeCategoryError extends HomeCategoryState {
  final String? error;

  const HomeCategoryError({required this.error});
}
