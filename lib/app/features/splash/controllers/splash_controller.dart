import 'package:get/get.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/services/auth_service.dart';

class SplashController extends BaseController implements GetxService {
  final auth = injector.get<AuthService>();

  @override
  void onInit() async {
    await auth.checkAuth();
    super.onInit();
  }
}
