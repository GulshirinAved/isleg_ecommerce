import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/data/models/getHeaderData_model.dart';

class GetHeaderProvider {
  Dio dio = Dio();
  final Box langBox = Hive.box('lang');

  Future<List<dynamic>> fetchGetHeader() async {
    final String lang = langBox.get('lang');
    final String getHeaderUrl = '$url$lang/header';

    try {
      final Response response = await dio.get(getHeaderUrl);
      if (response.statusCode == 200) {
        final List getHeaderList = response.data['header_data']
            .map((json) => HeaderData.fromJson(json))
            .toList();
        return getHeaderList;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
