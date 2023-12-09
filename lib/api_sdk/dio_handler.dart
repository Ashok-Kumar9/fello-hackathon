import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fello/api_sdk/urls.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dio/dio_helpers/dio_interceptor.dart';

class DioHandler {
  late Dio _dio;

  DioHandler() {
    _dio = Dio(
      BaseOptions(
        baseUrl: getBaseUrl(),
        contentType: 'application/json',
        responseType: ResponseType.json,
        followRedirects: false,
        validateStatus: (_) => true,
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );
    _dio.interceptors.addAll({DioInterceptor()});
  }

  Future<dynamic> makeRequest({
    required String endpoint,
    String method = 'GET',
    dynamic data,
    Map<String, dynamic>? queryParameters,
    var onSendProgress,
    bool skipToken = false,
    bool accessApiKey = false,
  }) async {
    try {
      final Response response = await _dio.request(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          extra: {
            'passToken': skipToken,
            'Access-Api-Key': accessApiKey,
          },
        ),
        onSendProgress: onSendProgress,
      );
      log(response.statusCode.toString());
      if ((response.statusCode ?? 800) < 300 &&
          (response.statusCode ?? 800) >= 200) {
        return response;
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      if (e is DioException && (e.type == DioExceptionType.unknown)) {
        Fluttertoast.showToast(msg: 'No Internet Connection');
      } else if (e is DioException &&
          (e.type == DioExceptionType.connectionError)) {
        Fluttertoast.showToast(msg: 'Something went wrong.');
      }
      log('here 00');
    }
  }
}
