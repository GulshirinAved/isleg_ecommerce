import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/data/models/getCategoryProduct_model.dart';

class GetCategoryProductProvider {
  Dio dio = Dio();
  final Box langBox = Hive.box('lang');
  Future<List<dynamic>> fetchCategoryProduct(String id) async {
    final String lang = langBox.get('lang');
    final String getCategoryProductUrl = '$url$lang/category/$id/10/1';
    try {
      final Response response = await dio.post(getCategoryProductUrl);
      if (response.statusCode == 200) {
        final List categoryProductList = response.data['category']
            .map((json) => GetCategoryProduct.fromJson(json))
            .toList();
        return categoryProductList;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
