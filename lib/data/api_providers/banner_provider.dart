import 'package:dio/dio.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/data/models/banner_model.dart';

class BannerProvider {
  Dio dio = Dio();
  final String _bannerUrl = '${url}tm/banners';
  Future<List<dynamic>> fetchBanner() async {
    try {
      final Response response = await dio.get(_bannerUrl);
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
