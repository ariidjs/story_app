import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/core/widget/custom_text_field.dart';
import 'package:story_app/app/features/auth/controllers/auth_controller.dart';
import 'package:story_app/app/features/auth/widgets/login_form.dart';

class AuthScreen extends BaseView<AuthController> {
  AuthScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorPrimary,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        background(),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                  color: AppColors.colorWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
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
                    _buildContent()
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(24),
      ),
      height: 60,
      padding: EdgeInsets.all(6),
      child: Row(
        children: [
          Obx(
            () => Expanded(
              flex: 2,
              child: InkWell(
                onTap: () => controller.authType.value = AuthType.signIn,
                child: controller.authType.value == AuthType.signIn
                    ? Container(
                        decoration: BoxDecoration(
                          color: AppColors.colorWhite,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            'Sign in',
                            style: normalBoldTextStyles,
                          )),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text('Sign in')),
                      ),
              ),
            ),
          ),
          Obx(
            () => Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () => controller.authType.value = AuthType.signUp,
                  child: controller.authType.value == AuthType.signUp
                      ? Container(
                          decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              'Sign up',
                              style: normalBoldTextStyles,
                            )),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('Sign up')),
                        ),
                )),
          ),
        ],
      ),
    );
  }

  background() {
    return Container(
      decoration: const BoxDecoration(color: AppColors.colorPrimary),
    );
  }

  _buildContent() {
    return Obx(() => controller.authType.value == AuthType.signIn
        ? LoginForm()
        : Container());
  }
}
