import 'package:dio/dio.dart';

class Api {
  final String _baseUrl = "http://10.0.2.2/yummy_home/api/";
  final Dio _dio;

  Api(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$_baseUrl$endPoint");
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    var response = await _dio.post(
      "$_baseUrl$endPoint",
      data: data,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return response.data;
  }
}
