import 'package:dio/dio.dart';

abstract class NetworkRequesterBase {
  Future request(
    String baseUrl,
    String path,
  );
}

class MENetworkRequester implements NetworkRequesterBase {
  static final Dio _dio = Dio();
  static final MENetworkRequester _instance = MENetworkRequester.internal();
  factory MENetworkRequester() {
    return _instance;
  }
  MENetworkRequester.internal();
  @override
  Future request(
    String baseUrl,
    String path,
  ) async {
    try {
      var response = await _dio.request(
        "$baseUrl$path",
        options: Options(
          method: "GET",
        ),
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response.data;
      } else {
        return {};
      }
    } on DioException catch (_) {
      return {};
    } catch (e) {
      return {};
    }
  }
}
