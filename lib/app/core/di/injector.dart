import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_app/app/core/services/auth_service.dart';
import 'package:story_app/app/core/services/language_controller.dart';

final injector = GetIt.instance;

void initDependencies() async {
  injector.registerSingleton<GetStorage>(GetStorage());
  injector.registerSingleton<AuthService>(AuthService());
  injector.registerSingleton<LanguageController>(LanguageController());
}
