part of 'category_product_bloc.dart';

sealed class CategoryProductEvent extends Equatable {
  const CategoryProductEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryProductList extends CategoryProductEvent {
  final String id;

  const GetCategoryProductList({required this.id});
}
