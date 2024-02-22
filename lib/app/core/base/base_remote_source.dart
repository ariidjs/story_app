import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:story_app/app/core/network/dio_provider.dart';
import 'package:story_app/app/core/network/exceptions/exceptions.dart';

import '../network/error_handlers.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.httpDio;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      if (response.statusCode != HttpStatus.ok) {
        debugPrint('Error with code : ${response.statusCode}');
      }

      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      debugPrint(
          "Throwing error from repository: $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      debugPrint("Generic error: $error");

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
