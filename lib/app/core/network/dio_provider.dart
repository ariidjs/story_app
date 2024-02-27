import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/services/auth_service.dart';
import 'package:story_app/app/core/values/constants.dart';
import 'package:story_app/app/data/api_config.dart';

import 'pretty_dio_logger.dart';

class DioProvider {
  static Dio? _instance;

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);

  static final BaseOptions _options = BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    connectTimeout: 60 * 1000,
    receiveTimeout: 60 * 1000,
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);

      _instance!.interceptors.add(_prettyDioLogger);

      return _instance!;
    } else {
      _instance!.interceptors.clear();
      _instance!.interceptors.add(_prettyDioLogger);

      return _instance!;
    }
  }

  static Dio get dioWithHeaderToken {
    final token = injector.get<AuthService>().token;
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _options.headers['Authorization'] = 'Bearer $token';

    _instance!.interceptors.add(_prettyDioLogger);
    return _instance!;
  }
}
