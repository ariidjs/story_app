import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/services/auth_service.dart';

class HomeController extends BaseController {
  signOut() {
    final auth = injector.get<AuthService>();
    auth.signOut();
  }
}
