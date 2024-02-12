// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const MAIN = _Paths.MAIN;
  static const HOME = _Paths.HOME;
  static const DETAILS = _Paths.DETAILS;
}

abstract class _Paths {
  static const MAIN = '/main';
  static const HOME = '/home';
  static const DETAILS = '/details';
}
