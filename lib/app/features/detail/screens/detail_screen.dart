import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/models/ui_state.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/core/widget/loading.dart';
import 'package:story_app/app/features/detail/controllers/detail_controller.dart';
import 'package:story_app/app/features/detail/widgets/maps_widget.dart';

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
    final ScrollController ctx = ScrollController();
    return Obx(
      () => Container(
        color: AppColors.colorBlack,
        width: double.infinity,
        child: Column(
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(controller.story.name ?? '',
                              style: normalBoldTextStyles.copyWith(
                                  color: AppColors.colorWhite)),
                          SizedBox(
                            child: ReadMoreText(
                                controller.story.description ?? '',
                                trimLines: 2,
                                trimMode: TrimMode.Line,
                                style: smallTextStyles.copyWith(
                                    color: AppColors.colorWhite)),
                          ),
                          controller.story.lat != null &&
                                  controller.story.lon != null
                              ? TextButton(
                                  onPressed: () => ctx.animateTo(
                                      ctx.position.maxScrollExtent,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut),
                                  child: Text(
                                    AppLocalizations.of(context)!.seeMaps,
                                    style: normalTextStyles.copyWith(
                                        color: AppColors.colorWhite),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
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
                      child: SingleChildScrollView(
                        controller: ctx,
                        child: Column(
                          children: [
                            Center(
                              child: CachedNetworkImage(
                                imageUrl: controller.story.photoUrl ?? '',
                                placeholder: (context, url) => const Loading(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            controller.story.lat != null &&
                                    controller.story.lon != null
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    child: MapsWidget(story: controller.story))
                                : const Text('')
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
