import 'package:flutter/material.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/core/widget/custom_text_field.dart';
import 'package:story_app/app/features/auth/controllers/auth_controller.dart';

class AuthScreen extends BaseView<AuthController> {
  AuthScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            _buildHeader(),
            const SizedBox(height: 16),
            _buildEmailField(),
            const SizedBox(height: 16),
            _buildPasswordField(),
            const SizedBox(height: 16),
            _buildLoginBtn(),
            const SizedBox(height: 24),
            _buildFooter()
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: CustomFormField(
        title: 'Email',
        isShowTitle: true,
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        onChanged: (value) {},
        validator: (_) {},
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: CustomFormField(
        title: 'Password',
        isShowTitle: true,
        obscureText: true,
        controller: passwordController,
        maxLength: 12,
        onChanged: (value) {},
        validator: (_) {},
      ),
    );
  }

  Widget _buildLoginBtn() {
    return ElevatedButton(
      style: primaryBtn,
      onPressed: () {},
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Login',
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Still dont have a account? Lets",
          style: normalTextStyles.copyWith(fontSize: 18),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "Sign Up",
              style: normalBoldTextStyles.copyWith(
                  fontSize: 18, color: AppColors.colorOnPrimary),
            ))
      ],
    );
  }

  _buildHeader() {
    return Column();

    // Text(
    //           "Sign In",
    //           style: largeBoldTextStyles.copyWith(fontSize: 20),
    //         ),
    //         const SizedBox(height: 8),
    //         Text(
    //           "Before continue, Lets Login",
    //           style: normalTextStyles.copyWith(fontSize: 18),
    //         ),
  }
}
