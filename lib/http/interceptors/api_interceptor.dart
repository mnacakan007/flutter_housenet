import 'dart:io';

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final apiUrl = 'https://cashier-api.housenet.am/api/auth';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = apiUrl;
    options.headers['x-device-type'] = Platform.operatingSystem.toLowerCase();
    if (options.data is Map) {
      /// remove nulls from request body [options.data]
      (options.data as Map<dynamic, dynamic>).removeWhere((k, v) => v == null);
    }
    return handler.next(options);
  }
}
