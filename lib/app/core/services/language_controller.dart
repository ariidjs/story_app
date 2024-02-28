import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/values/constants.dart';

class LanguageController extends BaseController {
  final storage = injector.get<GetStorage>();
  final _locale = const Locale('en').obs;
  Locale get locale => _locale.value;

  @override
  void onInit() {
    if (storage.read(Constants.keyLang) != null) {
      _locale.value = Locale(storage.read(Constants.keyLang));
    }
    super.onInit();
  }
}
