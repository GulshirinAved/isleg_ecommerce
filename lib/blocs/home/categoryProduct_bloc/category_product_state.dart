part of 'category_product_bloc.dart';

sealed class CategoryProductState extends Equatable {
  const CategoryProductState();

  @override
  List<Object> get props => [];
}

final class CategoryProductInitial extends CategoryProductState {}

final class CategoryProductLoading extends CategoryProductState {}

final class CategoryProductLoaded extends CategoryProductState {
  final List<dynamic> categoryProductList;

  const CategoryProductLoaded({required this.categoryProductList});
}

final class CategoryProductError extends CategoryProductState {
  final String? error;

  const CategoryProductError({required this.error});
}
