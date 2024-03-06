import 'package:isleg_ecommerce/data/api_providers/homeCategory_provider.dart';

class HomeCategoryRepository {
  final HomeCategoryProvider _homeCatgeoryProvider = HomeCategoryProvider();
  Future<List<dynamic>> fetchHomeCategoryList() async {
    return _homeCatgeoryProvider.fetchHomeCategory();
  }
}
