import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:story_app/app/core/models/ui_state.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/widget/custom_button.dart';
import 'package:story_app/app/core/widget/custom_text_field.dart';
import 'package:story_app/app/features/auth/controllers/auth_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

final AuthController controller = Get.find();

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 36),
          _buildEmailField(controller),
          const SizedBox(height: 16),
          _buildPasswordField(controller),
          const SizedBox(height: 24),
          _buildLoginBtn(controller)
        ],
      ),
    );
  }
}

Widget _buildEmailField(AuthController controller) {
  return Container(
    margin: const EdgeInsets.only(left: 8, right: 8),
    child: CustomFormField(
      title: AppLocalizations.of(Get.context!)!.email,
      isShowTitle: false,
      prefixIcon: const Icon(
        Icons.email,
        color: AppColors.colorPrimary,
      ),
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      onChanged: (value) => controller.email.value = value,
      validator: (_) => emailController.text.isNotEmpty
          ? !controller.isEmailValid.value
              ? AppLocalizations.of(Get.context!)!.invalidEmail
              : null
          : null,
    ),
  );
}

Widget _buildPasswordField(AuthController controller) {
  return Container(
    margin: const EdgeInsets.only(left: 8, right: 8),
    child: CustomFormField(
      title: AppLocalizations.of(Get.context!)!.password,
      isShowTitle: false,
      obscureText: true,
      prefixIcon: const Icon(
        Icons.lock,
        color: AppColors.colorPrimary,
      ),
      controller: passwordController,
      maxLength: 16,
      onChanged: (value) => controller.password.value = value,
      validator: (_) => passwordController.text.isNotEmpty
          ? !controller.isPasswordValid.value
              ? AppLocalizations.of(Get.context!)!.invalidPassword
              : null
          : null,
    ),
  );
}

Widget _buildLoginBtn(AuthController controller) {
  return Container(
    constraints: const BoxConstraints(minWidth: double.infinity),
    child: Obx(
      () => CustomButton(
        title: AppLocalizations.of(Get.context!)!.signIn,
        icon: const Icon(Icons.login),
        onPressed: () => controller.signIn(),
        state: controller.uiState == UiState.loading
            ? ButtonState.loading
            : ButtonState.idle,
      ),
    ),
  );
}
