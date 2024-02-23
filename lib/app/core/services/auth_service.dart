import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/di/injector.dart';
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

  void signIn() {
    _authState.value = AuthState.loggedIn;
  }

  void signOut() {
    _authState.value = AuthState.loggedOut;
  }
}

enum AuthState { loggedIn, loggedOut, loading }
