// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../features/splash/bindings/splash_binding.dart';
import '../features/splash/screen/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => HomeScreen(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: _Paths.DETAILS,
    //   page: () => DetailScreen(),
    //   binding: DetailBinding(),
    // ),
  ];
}
