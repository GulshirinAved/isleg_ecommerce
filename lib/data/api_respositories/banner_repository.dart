import 'package:isleg_ecommerce/data/api_providers/banner_provider.dart';

class BannerRepository {
  final BannerProvider _bannerProvider = BannerProvider();
  Future<List<dynamic>> fetchBannerList() async {
    return _bannerProvider.fetchBanner();
  }
}
