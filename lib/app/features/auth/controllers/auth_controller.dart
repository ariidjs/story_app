import 'package:get/get.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/services/auth_service.dart';
import 'package:story_app/app/core/utils/validator.dart';
import 'package:story_app/app/data/models/requests/sign_in_request.dart';
import 'package:story_app/app/data/models/requests/sign_up_request.dart';
import 'package:story_app/app/data/repository/story_repository.dart';

class AuthController extends BaseController {
  final StoryRepository _repo = Get.find(tag: (StoryRepository).toString());
  final authService = injector.get<AuthService>();

  Rx<AuthType> authType = AuthType.signIn.obs;

  final email = ''.obs;
  final isEmailValid = false.obs;

  final password = ''.obs;
  final isPasswordValid = false.obs;

  final confirmPassword = ''.obs;
  final isPasswordSame = false.obs;

  final name = ''.obs;
  final isNameValid = false.obs;

  @override
  void onInit() {
    _emailCheck();
    _passwordCheck();
    _confirmPasswordCheck();
    _nameCheck();
    super.onInit();
  }

  void _nameCheck() {
    debounce(name, (text) => isNameValid.value = text.isNotEmpty,
        time: const Duration(milliseconds: 1));
  }

  void _emailCheck() {
    debounce(
        email, (text) => isEmailValid.value = UtilValidators.isValidEmail(text),
        time: const Duration(milliseconds: 100));
  }

  void _passwordCheck() {
    debounce(password,
        (text) => isPasswordValid.value = UtilValidators.isValidPassword(text),
        time: const Duration(milliseconds: 100));
  }

  void _confirmPasswordCheck() {
    debounce(
        confirmPassword,
        (text) =>
            isPasswordSame.value = password.value == confirmPassword.value,
        time: const Duration(milliseconds: 1));
  }

  void signIn() {
    callDataService(
      _repo.signIn(SignInRequest(email: email.value, password: password.value)),
      onSuccess: (response) => authService.signIn(response),
    );
  }

  void signUp() async {
    if (isEmailValid.value &&
        isNameValid.value &&
        isPasswordSame.value &&
        isPasswordValid.value) {
      callDataService(
          _repo.signUp(SignUpRequest(
              name: name.value, email: email.value, password: password.value)),
          onSuccess: (_) => authType.value = AuthType.signIn);
    } else {
      showErrorMessage('Please fill required data');
    }
  }
}

enum AuthType {
  signIn,
  signUp,
}
