import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_app/app/core/values/app_colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Platform.isIOS
            ? Container(
                color: AppColors.colorWhite,
                child: const CupertinoActivityIndicator(
                  color: AppColors.colorPrimary,
                ),
              )
            : const CircularProgressIndicator(
                color: AppColors.colorPrimary,
              ));
  }
}
