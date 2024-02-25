import 'package:flutter/material.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/core/widget/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        children: [
          _buildEmailField(),
          SizedBox(
            height: 16,
          ),
          _buildPasswordField(),
          SizedBox(
            height: 24,
          ),
          _buildLoginBtn()
        ],
      ),
    );
  }
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
  return Container(
    constraints: BoxConstraints(minWidth: double.infinity),
    child: ElevatedButton(
      style: primaryBtn,
      onPressed: () {},
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'Login',
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
