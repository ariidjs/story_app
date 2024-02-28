import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/models/ui_state.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/features/add_story/controllers/add_controller.dart';

class PreviewScreen extends BaseView<AddController> {
  final String photoPath;
  PreviewScreen({super.key, required this.photoPath});
  final descController = TextEditingController();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(Get.context!)!.addStory,
        style: largeBoldTextStyles.copyWith(color: AppColors.colorPrimary),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.colorOnPrimary),
      backgroundColor: AppColors.colorWhite,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Center(
            child: Image.file(
              File(photoPath),
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: AppColors.colorOnPrimary.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: TextField(
                          maxLines: null,
                          controller: descController,
                          decoration: InputDecoration(
                            hintText:
                                AppLocalizations.of(Get.context!)!.addDesc,
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    controller.uiState == UiState.loading
                        ? Container(
                            width: 36,
                            padding: const EdgeInsets.all(8.0),
                            height: 36,
                            child: const CircularProgressIndicator(
                                color: AppColors.colorOnPrimary))
                        : IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: AppColors.colorOnPrimary,
                            ),
                            onPressed: () => controller.addStory(
                                descController.text, photoPath),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
