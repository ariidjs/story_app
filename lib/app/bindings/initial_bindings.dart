import 'package:get/get.dart';
import 'package:story_app/app/bindings/data_bindings.dart';
import 'package:story_app/app/features/add_story/bindings/add_bindings.dart';
import 'package:story_app/app/features/auth/bindings/auth_bindings.dart';
import 'package:story_app/app/features/detail/bindings/detail_binding.dart';
import 'package:story_app/app/features/home/bindings/home_binding.dart';
import 'package:story_app/app/features/splash/bindings/splash_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    DataBindings().dependencies();
    SplashBinding().dependencies();
    HomeBinding().dependencies();
    AuthBinding().dependencies();
    DetailBinding().dependencies();
    AddBinding().dependencies();
  }
}
