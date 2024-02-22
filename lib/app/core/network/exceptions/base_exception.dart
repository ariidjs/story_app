part of 'exceptions.dart';

abstract class BaseException implements Exception {
  final String message;

  BaseException({this.message = ""});
}
