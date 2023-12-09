import 'package:dio/dio.dart';

import 'dio_exceptions.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with the response data.
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _handleError(err);
    super.onError(err, handler); //
  }

  _handleError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        throw TimeOutException('TimeOut', err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(
              err.error.toString(),
              err.requestOptions,
            );
          case 401:
            throw UnauthorisedException(
              err.error.toString(),
              err.requestOptions,
            );
          case 403:
            throw UnauthorisedException(
              err.error.toString(),
              err.requestOptions,
            );
          case 404:
            throw FileNotFoundException(
              err.error.toString(),
              err.requestOptions,
            );
          case 406:
            throw UnauthorisedException(
              err.error.toString(),
              err.requestOptions,
            );
          case 500:
            throw InternalServerException(
              err.error.toString(),
              err.requestOptions,
            );
          case 502:
            throw BadGateWayException(
              err.error.toString(),
              err.requestOptions,
            );
          case 503:
            throw BadGateWayException(
              err.error.toString(),
              err.requestOptions,
            );
        }
        break;
      case DioExceptionType.unknown:
      default:
        throw err;
    }
  }
}

class TokenManager {
  TokenManager._privateConstructor();

  static final TokenManager _instance = TokenManager._privateConstructor();

  factory TokenManager() {
    return _instance;
  }
//
// bool isTokenExpired(String token) {
//   Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
//   int expirationTimestamp = decodedToken['exp'] * 1000;
//
//   DateTime currentTime = DateTime.now();
//   DateTime tokenExpirationTime =
//       DateTime.fromMillisecondsSinceEpoch(expirationTimestamp);
//
//   Duration bufferDuration = const Duration(seconds: 15);
//   DateTime tokenExpirationBuffered =
//       tokenExpirationTime.subtract(bufferDuration);
//
//   return currentTime.isAfter(tokenExpirationBuffered);
// }
//
// Future<void> fetchNewToken(String refreshToken) async {
//   final response = await DioHandler().makeRequest(
//     endpoint: EndPoints.getEndpoint(EndPoints.fetchNewToken),
//     method: 'POST',
//     data: FormData.fromMap({"refresh": refreshToken}),
//     skipToken: true,
//   );
//   if (response == null || response.data == null) {
//     return;
//   }
//   SharedPrefs().authToken = response.data["data"];
// }
}
