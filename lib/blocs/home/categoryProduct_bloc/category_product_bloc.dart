import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isleg_ecommerce/data/api_respositories/getCategoryProduct_repository.dart';

part 'category_product_event.dart';
part 'category_product_state.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
  CategoryProductBloc() : super(CategoryProductInitial()) {
    final GetCategoryProductRepository categoryProductRepository =
        GetCategoryProductRepository();
    on<GetCategoryProductList>((event, emit) async {
      try {
        emit(CategoryProductLoading());
        final List<dynamic> categoryProductList =
            await categoryProductRepository.fetchCategoryProductList(event.id);
        emit(CategoryProductLoaded(categoryProductList: categoryProductList));
      } catch (e) {
        emit(CategoryProductError(error: e.toString()));
      }
    });
  }
}
