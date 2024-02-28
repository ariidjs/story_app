import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:story_app/app/core/models/ui_state.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/widget/custom_button.dart';
import 'package:story_app/app/core/widget/custom_text_field.dart';
import 'package:story_app/app/features/auth/controllers/auth_controller.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final confpasswordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();

    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            CustomFormField(
              title: AppLocalizations.of(Get.context!)!.name,
              controller: nameController,
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(
                Icons.person,
                color: AppColors.colorPrimary,
              ),
              onChanged: (value) => controller.name.value = value,
              validator: (_) => nameController.text.isNotEmpty
                  ? !controller.isNameValid.value
                      ? AppLocalizations.of(Get.context!)!.requiredField
                      : null
                  : null,
            ),
            const SizedBox(height: 8),
            CustomFormField(
              title: AppLocalizations.of(Get.context!)!.email,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              prefixIcon: const Icon(
                Icons.email,
                color: AppColors.colorPrimary,
              ),
              onChanged: (value) => controller.email.value = value,
              validator: (_) => emailController.text.isNotEmpty
                  ? !controller.isEmailValid.value
                      ? AppLocalizations.of(Get.context!)!.invalidEmail
                      : null
                  : null,
            ),
            const SizedBox(height: 8),
            CustomFormField(
              title: AppLocalizations.of(Get.context!)!.password,
              obscureText: true,
              keyboardType: TextInputType.text,
              controller: passwordController,
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColors.colorPrimary,
              ),
              onChanged: (value) => controller.password.value = value,
              validator: (_) => passwordController.text.isNotEmpty
                  ? !controller.isPasswordValid.value
                      ? AppLocalizations.of(Get.context!)!.invalidPassword
                      : null
                  : null,
            ),
            const SizedBox(height: 8),
            CustomFormField(
              title: AppLocalizations.of(Get.context!)!.confPassword,
              obscureText: true,
              keyboardType: TextInputType.text,
              controller: confpasswordController,
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColors.colorPrimary,
              ),
              onChanged: (value) => controller.confirmPassword.value = value,
              validator: (_) => passwordController.text.isNotEmpty
                  ? !controller.isPasswordSame.value
                      ? AppLocalizations.of(Get.context!)!.passwordNotMatch
                      : null
                  : null,
            ),
            const SizedBox(height: 24),
            Container(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: Obx(
                () => CustomButton(
                  title: AppLocalizations.of(Get.context!)!.signUp,
                  onPressed: () => controller.signUp(),
                  state: controller.uiState == UiState.loading
                      ? ButtonState.loading
                      : ButtonState.idle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
