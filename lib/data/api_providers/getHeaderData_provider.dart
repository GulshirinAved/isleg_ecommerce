import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/data/models/getHeaderData_model.dart';

class GetHeaderProvider {
  Dio dio = Dio();
  Box headerBox = Hive.box('headerBox');
  final Box langBox = Hive.box('lang');
  Future<List<dynamic>> fetchGetHeader() async {
    final String lang = langBox.get('lang');
    final String getHeaderUrl = '$url$lang/header';

    try {
      if (headerBox.isEmpty) {
        final Response response = await dio.get(getHeaderUrl);
        final List getHeaderList = response.data['header_data']['categories']
            .map((json) => Category.fromJson(json))
            .toList();
        final List<dynamic> serializedHeaderList =
            getHeaderList.map((e) => e.toJson()).toList();
        await headerBox.addAll(serializedHeaderList);
        final List<dynamic> cachedHeaderList =
            headerBox.values.map((e) => Category.fromJson(e)).toList();
        return cachedHeaderList;
      } else {
        final List<dynamic> cachedHeaderList =
            headerBox.values.map((e) => Category.fromJson(e)).toList();
        return cachedHeaderList;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
