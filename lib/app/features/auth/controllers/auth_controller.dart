import 'package:get/state_manager.dart';
import 'package:story_app/app/core/base/base.dart';

class AuthController extends BaseController {
  Rx<AuthType> authType = AuthType.signIn.obs;
}

enum AuthType {
  signIn,
  signUp,
}
