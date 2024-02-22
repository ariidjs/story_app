import 'package:flutter/material.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/constants.dart';

import '../../../core/base/base.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends BaseView<SplashController> {
  SplashScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(backgroundColor: AppColors.colorPrimary);
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      color: AppColors.colorPrimary,
      // child: Center(
      //     child: Image.asset(
      //   '${Constants.imgPath}img_logo.png',
      // )),
    );
  }
}
