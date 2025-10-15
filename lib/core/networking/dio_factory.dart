import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;
  static Dio getDio() {
    Duration timeOut = ApiConstants.connectTimeout;
    if (_dio == null) {
      _dio = Dio()
        ..options = BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: timeOut,
          receiveTimeout: ApiConstants.receiveTimeout,
          headers: {
            'Content-Type': ApiConstants.contentType,
            'Accept': ApiConstants.accept,
          },
        );

      _addInterceptors();
      return _dio!;
    } else {
      return _dio!;
    }
  }

  static void _addInterceptors() {
    _dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }
}
