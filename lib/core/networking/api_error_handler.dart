import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String handle(dynamic error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout) {
        return "Connection timeout. Please try again.";
      } else if (error.type == DioExceptionType.receiveTimeout) {
        return "Server took too long to respond.";
      } else if (error.type == DioExceptionType.badResponse) {
        final statusCode = error.response?.statusCode ?? 0;
        switch (statusCode) {
          case 400:
            return "Bad request. Please check your data.";
          case 401:
            return "Unauthorized. Please log in again.";
          case 404:
            return "Resource not found.";
          case 500:
            return "Server error. Try again later.";
          default:
            return "Unexpected error: $statusCode";
        }
      } else {
        return "Network error. Please check your connection.";
      }
    } else {
      return "Something went wrong. Please try again.";
    }
  }
}
