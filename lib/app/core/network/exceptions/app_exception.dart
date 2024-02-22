part of 'exceptions.dart';

class AppException extends BaseException {
  AppException({
    String message = "",
  }) : super(message: message);
}
