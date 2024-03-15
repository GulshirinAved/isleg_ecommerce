import 'package:isleg_ecommerce/data/api_providers/getCategoryProduct_provider.dart';

class GetCategoryProductRepository {
  final GetCategoryProductProvider _getCategoryProvider =
      GetCategoryProductProvider();
  Future<List<dynamic>> fetchCategoryProductList(String id) async {
    return _getCategoryProvider.fetchCategoryProduct(id);
  }
}
