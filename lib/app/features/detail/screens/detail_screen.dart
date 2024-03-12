import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/models/ui_state.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/core/widget/loading.dart';
import 'package:story_app/app/features/detail/controllers/detail_controller.dart';

class DetailScreen extends BaseView<DetailController> {
  final String id;
  DetailScreen({super.key, required this.id}) {
    controller.getDetail(id);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onVerticalDragDown: (_) => Get.back(),
        child: Container(
          color: AppColors.colorBlack,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 36,
                      width: 36,
                      child: CircleAvatar(
                        backgroundColor: AppColors.colorOnPrimary,
                        child: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.story.name ?? '',
                              style: normalBoldTextStyles.copyWith(
                                  color: AppColors.colorWhite)),
                          Text(controller.story.description ?? '',
                              style: smallTextStyles.copyWith(
                                  color: AppColors.colorWhite)),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () => context.goNamed('home'),
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.colorWhite,
                        ))
                  ],
                ),
              ),
              controller.uiState == UiState.loading
                  ? const Loading()
                  : Expanded(
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: controller.story.photoUrl!,
                          placeholder: (context, url) => const Loading(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
