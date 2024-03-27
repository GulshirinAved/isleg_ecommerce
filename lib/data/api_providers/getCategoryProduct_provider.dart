import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/data/models/getCategoryProduct_model.dart';

class GetCategoryProductProvider {
  Dio dio = Dio();
  final Box langBox = Hive.box('lang');
  Box categoryProductBox = Hive.box('categoryProductBox');
  Future<List<dynamic>> fetchCategoryProduct(
    String id,
    Map<String, dynamic> postData,
  ) async {
    final String lang = langBox.isNotEmpty ? langBox.get('lang') : 'tm';
    final String getCategoryProductUrl = '$url$lang/category/$id/10/1';

    final data = json.encode(postData);

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
