import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/models/auth_response.dart';
import 'package:story_app/app/core/values/constants.dart';

class AuthService extends BaseController {
  final Rx<AuthState> _authState = AuthState.loading.obs;
  Rx<AuthState> get authState => _authState;

  final storage = injector.get<GetStorage>();

  Future<void> checkAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    if (storage.read(Constants.keyToken) == null) {
      _authState.value = AuthState.loggedOut;
    } else {
      _authState.value = AuthState.loggedIn;
    }
  }

  void signIn(LoginResult? data) async {
    _authState.value = AuthState.loggedIn;
    await storage.write(Constants.keyToken, data!.token);
  }

  void signOut() {
    _authState.value = AuthState.loggedOut;
    storage.remove(Constants.keyToken);
  }
}

enum AuthState { loggedIn, loggedOut, loading }
