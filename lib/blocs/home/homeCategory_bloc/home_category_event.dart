part of 'home_category_bloc.dart';

sealed class HomeCategoryEvent extends Equatable {
  const HomeCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetHomeCategoryList extends HomeCategoryEvent {}
