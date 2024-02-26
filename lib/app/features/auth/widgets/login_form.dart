import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/core/widget/custom_text_field.dart';
import 'package:story_app/app/features/auth/controllers/auth_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();
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

final emailController = TextEditingController();
final passwordController = TextEditingController();

Widget _buildEmailField(AuthController controller) {
  return Container(
    margin: const EdgeInsets.only(left: 8, right: 8),
    child: CustomFormField(
      title: 'Email',
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
              ? 'Invalid Email'
              : null
          : null,
    ),
  );
}

Widget _buildPasswordField(AuthController controller) {
  return Container(
    margin: const EdgeInsets.only(left: 8, right: 8),
    child: CustomFormField(
      title: 'Password',
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
              ? 'Invalid Password'
              : null
          : null,
    ),
  );
}

Widget _buildLoginBtn(AuthController controller) {
  return Container(
    constraints: const BoxConstraints(minWidth: double.infinity),
    child: Obx(
      () => ElevatedButton(
        style: controller.isEmailValid.value && controller.isPasswordValid.value
            ? primaryBtn
            : disabledPrimaryBtn,
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Sign In',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
