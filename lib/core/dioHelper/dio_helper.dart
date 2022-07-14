import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static const String baseUrl =
      'https://www.inoutdesigners.com/talabat/public/api/';

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  //===============================================================
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {'Accept': 'application/json'};
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

//===============================================================
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {'Accept': 'application/json'};
    return dio!.post(url, queryParameters: query, data: data, options: Options(
      validateStatus: (status) {
        return status! < 500;
      },
    ));
  } //===============================================================

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {'Accept': 'application/json'};
    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
