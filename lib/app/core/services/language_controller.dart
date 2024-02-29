import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/values/constants.dart';
import 'package:story_app/app/routes/app_routes.dart';

class LanguageController extends BaseController {
  final storage = injector.get<GetStorage>();
  final _locale = const Locale('en').obs;
  Locale get locale => _locale.value;

  final _currentLang = ''.obs;
  String get currentLang => _currentLang.value;

  @override
  void onInit() {
    if (storage.read(Constants.keyLang) != null) {
      _locale.value = Locale(storage.read(Constants.keyLang));
    }
    super.onInit();
  }

  void setLang(String code) async {
    await storage.write(Constants.keyLang, code);
    _locale.value = Locale(code);
    Get.updateLocale(locale);
    goRouter.pop();
  }

  void getLang() =>
      _currentLang.value = storage.read(Constants.keyLang) ?? 'en';
}
