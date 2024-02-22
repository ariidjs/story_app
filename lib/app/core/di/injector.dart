import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_app/app/core/services/auth_service.dart';
import 'package:story_app/app/features/splash/controllers/splash_controller.dart';

final injector = GetIt.instance;

void initDependencies() async {
  // await GetStorage.init();
  // injector.registerSingleton<GetStorage>(GetStorage());
  injector.registerSingleton<AuthService>(AuthService());
  // Get.lazyPut(() => SplashController());
}
