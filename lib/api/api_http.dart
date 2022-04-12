import 'package:get/get.dart';

class ApiHttp extends GetConnect {
  Future<Response> httpGet(
      {required String url, Map<String, dynamic>? query}) async {
    final response = await get(url, query: query, headers: {
      "Content-type": "application/json",
    });
    return response;
  }
}
