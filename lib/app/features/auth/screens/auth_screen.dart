import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/features/auth/controllers/auth_controller.dart';
import 'package:story_app/app/features/auth/widgets/login_form.dart';
import 'package:story_app/app/features/auth/widgets/signup_form.dart';

class AuthScreen extends BaseView<AuthController> {
  AuthScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    controller.lang.getLang();
    return AppBar(
      backgroundColor: AppColors.colorPrimary,
      automaticallyImplyLeading: false,
      titleTextStyle: normalBoldTextStyles,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            controller.lang.currentLang.toUpperCase(),
            style: normalBoldTextStyles.copyWith(color: AppColors.colorWhite),
          ),
          IconButton(
              onPressed: () => showLangDialog(context),
              icon: CountryFlag.fromCountryCode(
                controller.lang.currentLang == 'en' ? 'GB' : 'ID',
                height: 24,
                width: 24,
                borderRadius: 8,
              )),
        ],
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        background(),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: SizedBox(
            height: 400,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    _buildHeader(),
                    const SizedBox(height: 16),
                    Expanded(child: _buildContent())
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
      padding: const EdgeInsets.all(6),
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
                            AppLocalizations.of(Get.context!)!.signIn,
                            style: normalBoldTextStyles,
                          )),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                                AppLocalizations.of(Get.context!)!.signIn)),
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
                              AppLocalizations.of(Get.context!)!.signUp,
                              style: normalBoldTextStyles,
                            )),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                  AppLocalizations.of(Get.context!)!.signUp)),
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
      constraints: const BoxConstraints(
          minWidth: double.infinity, minHeight: double.infinity),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(Get.context!)!.setupDesc,
              style: largeBoldTextStyles.copyWith(
                  color: AppColors.colorWhite, fontSize: 30),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(Get.context!)!.setupDesc2,
              style: normalTextStyles.copyWith(color: AppColors.lightGreyColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Obx(() => controller.authType.value == AuthType.signIn
          ? const LoginForm()
          : SignUpForm()),
    );
  }
}
