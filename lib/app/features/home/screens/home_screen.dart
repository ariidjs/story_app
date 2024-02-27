import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/features/home/controllers/home_controller.dart';
import 'package:story_app/app/features/home/widgets/item_story.dart';

class HomeScreen extends BaseView<HomeController> {
  HomeScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Stories',
        style: largeBoldTextStyles.copyWith(color: AppColors.colorPrimary),
      ),
      centerTitle: true,
      backgroundColor: AppColors.colorWhite,
    );
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
          : Container(),
    );
  }
}
