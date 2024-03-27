import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/data/models/banner_model.dart';

class BannerProvider {
  Dio dio = Dio();
  final Box langBox = Hive.box('lang');

  Future<List<dynamic>> fetchBanner() async {
    final String lang = langBox.isNotEmpty ? langBox.get('lang') : 'tm';

    final String bannerUrl = '$url$lang/banners';

    try {
      final Response response = await dio.get(bannerUrl);
      if (response.statusCode == 200) {
        final List bannerList = response.data['banners']
            .map((json) => BannerModel.fromJson(json))
            .toList();

        return bannerList;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
