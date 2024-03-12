import 'package:isleg_ecommerce/data/api_providers/getHeaderData_provider.dart';

class GetHeaderRepository {
  final GetHeaderProvider _getHeaderProvider = GetHeaderProvider();
  Future<List<dynamic>> fetchGetHeaderList() async {
    return _getHeaderProvider.fetchGetHeader();
  }
}
