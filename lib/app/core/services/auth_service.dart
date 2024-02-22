import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/values/constants.dart';

class AuthService extends GetxController {
  // final storage = injector.get<GetStorage>();
  final Rx<AuthState> _authState = AuthState.loggedOut.obs;
  AuthState get authState => _authState.value;

  @override
  void onInit() {
    // _authState.value = storage.read(Constants.keyToken);
    super.onInit();
  }
}

enum AuthState { loggedIn, loggedOut }
