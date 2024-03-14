import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/data/models/homeCategory_model.dart';

class HomeCategoryProvider {
  Dio dio = Dio();
  Box dataBox = Hive.box('dataBox');
  Box langBox = Hive.box('lang');

  Future<List<dynamic>> fetchHomeCategory() async {
    final String lang = langBox.get('lang');
    final String homecategoryUrl = '$url$lang/homepage-categories';

    try {
      if (dataBox.isEmpty) {
        final Response response = await dio.get(homecategoryUrl);
        final List<dynamic> homeCategoryList = response
            .data['homepage_categories']
            .map((json) => HomeCategoryModel.fromJson(json))
            .toList();
        final List<dynamic> serializedHomeCategoryList =
            homeCategoryList.map((model) => model.toJson()).toList();
        await dataBox.addAll(serializedHomeCategoryList);
        final List<dynamic> cachedHomeCategoryList = dataBox.values
            .map((map) => HomeCategoryModel.fromJson(map))
            .toList();
        return cachedHomeCategoryList;
      } else {
        final List<dynamic> cachedHomeCategoryList = dataBox.values
            .map((map) => HomeCategoryModel.fromJson(map))
            .toList();
        return cachedHomeCategoryList;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
