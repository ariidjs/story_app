import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/core/widget/no_data_widget.dart';
import 'package:story_app/app/features/home/controllers/home_controller.dart';
import 'package:story_app/app/features/home/widgets/custom_floating_btn.dart';
import 'package:story_app/app/features/home/widgets/item_story.dart';

class HomeScreen extends BaseView<HomeController> {
  HomeScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text('Dicoding Story'),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => context.goNamed('maps'),
        icon: const Icon(
          Icons.location_pin,
          color: AppColors.colorBlack,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => showLangDialog(context),
          icon: const Icon(
            Icons.settings,
            color: AppColors.colorBlack,
          ),
        ),
        IconButton(
          onPressed: () {
            showAdaptiveDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: AppColors.pageBackground,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  alignment: AlignmentDirectional.center,
                  title: Text(AppLocalizations.of(context)!.logout),
                  content: Text(AppLocalizations.of(context)!.logoutDesc),
                  actions: [
                    ElevatedButton(
                      onPressed: () => controller.signOut(),
                      style: primaryBtn,
                      child: Text(
                        AppLocalizations.of(context)!.yes,
                        style: normalTextStyles.copyWith(
                            color: AppColors.colorWhite),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => context.pop(),
                      style: primaryBtn,
                      child: Text(AppLocalizations.of(context)!.no,
                          style: normalTextStyles.copyWith(
                              color: AppColors.colorWhite)),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(
            Icons.exit_to_app,
            color: AppColors.colorBlack,
          ),
        )
      ],
      backgroundColor: AppColors.colorWhite,
    );
  }

  @override
  Widget? floatingActionButton() {
    return const CustomFloatingButton();
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: storyList(),
    );
  }

  storyList() {
    return Obx(
      () => controller.stories.isNotEmpty
          ? ListView.separated(
              shrinkWrap: true,
              itemCount: controller.stories.length,
              primary: false,
              itemBuilder: (context, index) {
                var model = controller.stories[index];

                return ItemStory(item: model);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 0),
            )
          : const NoData(),
    );
  }
}
