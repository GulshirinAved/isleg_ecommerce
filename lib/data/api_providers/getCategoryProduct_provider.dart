import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/data/models/getCategoryProduct_model.dart';

class GetCategoryProductProvider {
  Dio dio = Dio();
  final Box langBox = Hive.box('lang');
  Box categoryProductBox = Hive.box('categoryProductBox');
  Future<List<dynamic>> fetchCategoryProduct(String id) async {
    final String lang = langBox.get('lang') ?? 'tr';
    final String getCategoryProductUrl = '$url$lang/category/$id/10/1';

    final data = json.encode({
      'status': true,
      'price_sort': 'ASC',
      'min_price': 0,
      'max_price': 100,
      'is_discount': false,
    });

    try {
      if (categoryProductBox.isEmpty) {}
      final Response response = await dio.post(
        getCategoryProductUrl,
        data: data,
      );

      if (response.statusCode == 200) {
        final List<Product> categories =
            (response.data['category']['products'] as List<dynamic>)
                .map((categoryJson) => Product.fromJson(categoryJson))
                .toList();
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
