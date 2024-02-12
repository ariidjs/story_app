import 'package:get/get.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/routes/app_pages.dart';

class SplashController extends BaseController {
  setUp() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(Routes.HOME);
  }
}
