import 'package:dio/dio.dart';
import 'package:lavescape/core/constant/app_constance.dart';


class DioHelper {
  static late Dio _dio;
  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstance.apisBaseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getdata({
    required String endPoint,
    Map<String, dynamic>? query,
    String? bearer,
  }) async {
    if (bearer == null) {
      _dio.options.headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept-Language':'en-Us',
        "Accept": "application/json"
      };
    } else {
      _dio.options.headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept-Language': 'en-Us',
        'Authorization': 'Bearer $bearer',
        "Accept": "application/json"
      };
    }
    return await _dio.get(endPoint, queryParameters: query);
  }


  static Future<Response> postdata({
    required String endPoint,
    data,
    bool isFormData = false,
    query,
    String? bearer,
  }) async {
    if (bearer == null) {
      _dio.options.headers = {
        'Content-Type':
            !isFormData ? 'application/json' : 'multipart/form-data',
        'lang': 'en-Us',
        "Accept-Language": "application/json"
      };
    } else {
      _dio.options.headers = {
        'Content-Type':
            !isFormData ? 'application/json' : 'multipart/form-data',
        'Accept-Language': 'en-Us',
        'Authorization': 'Bearer $bearer',
        "Accept": "application/json"
      };
    }
    return await _dio.post(
      endPoint,
      queryParameters: query,
      data: data,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
  }
static Future<Response> postVideoFrame({
  required String endPoint,
  required dynamic data,
  bool isFormData = false,
  Map<String, dynamic>? query,
  String? bearer,
}) async {
  try {
    _dio.options.headers = {
      'Content-Type': 'multipart/form-data',
      if (bearer != null) 'Authorization': 'Bearer $bearer',
    };

    return await _dio.post(
      endPoint,
      queryParameters: query,
      data:  data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ),
    );
  } catch (e) {
    print('Error posting video frame: $e');
    rethrow;
  }
}

  static Future<Response> putdata({
    required String endPoint,
    required data,
    query,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept-Language': 'en-Us',
    };
    return await _dio.put(endPoint, queryParameters: query, data: data);
  }

  static Future<Response> deleteData({
    required String endPoint,
    data,
    query,
    String? bearer,
  }) async {
    if (bearer == null) {
      _dio.options.headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'lang': 'en-Us',
        "Accept-Language": "application/json"
      };
    } else {
      _dio.options.headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept-Language': 'en-Us',
        'Authorization': 'Bearer $bearer',
        "Accept": "application/json"
      };
    }
    return await _dio.delete(
      endPoint,
      queryParameters: query,
      data: data,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
  }
}
