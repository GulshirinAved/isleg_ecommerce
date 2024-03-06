import 'package:dio/dio.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/data/models/homeCategory_model.dart';

class HomeCategoryProvider {
  Dio dio = Dio();
  final String _homecategoryUrl = '${url}tm/homepage-categories';
  Future<List<dynamic>> fetchHomeCategory() async {
    try {
      final Response response = await dio.get(_homecategoryUrl);
      final List<dynamic> homeCategoryList = response
          .data['homepage_categories']
          .map((json) => HomeCategoryModel.fromJson(json))
          .toList();

      return homeCategoryList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
