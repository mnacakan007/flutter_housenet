import 'package:dio/dio.dart';

import 'dio_flutter_transformer.dart';
import 'interceptors/api_interceptor.dart';
import 'interceptors/auth_interceptor.dart';

final options = BaseOptions(
  connectTimeout: const Duration(seconds: 32),
  receiveTimeout: const Duration(seconds: 32),
);

final dio = Dio(options)..interceptors.addAll([ApiInterceptor(), AuthInterceptor()])..transformer = FlutterTransformer();

CancelToken cancelToken = CancelToken();
