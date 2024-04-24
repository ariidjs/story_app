import 'dart:io';

import 'package:get/get.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/data/models/requests/add_story_request.dart';
import 'package:story_app/app/data/repository/story_repository.dart';
import 'package:story_app/app/features/add_story/models/add_models.dart';
import 'package:story_app/app/features/home/controllers/home_controller.dart';
import 'package:story_app/app/routes/app_routes.dart';
import 'package:story_app/flavors/build_config.dart';
import 'package:story_app/flavors/env_config.dart';

class AddController extends BaseController {
  final StoryRepository _repos = Get.find(tag: (StoryRepository).toString());
  final HomeController _homeController = Get.find();

  void addStory(String desc, String photoPath) async {
    final EnvConfig envConfig = BuildConfig.instance.config;
    if (envConfig.hasUniqueFeature) {
      if (desc.isNotEmpty) {
        goRouter.goNamed('picker',
            extra: AddModels(photoPath: photoPath, desc: desc));
      } else {
        showErrorMessage(AppLocalizations.of(Get.context!)!.fillRequiredData);
      }
    } else {
      if (desc.isNotEmpty) {
        postStory(desc, photoPath);
      } else {
        showErrorMessage(AppLocalizations.of(Get.context!)!.fillRequiredData);
      }
    }
  }

  void postStory(String desc, String photoPath) {
    callDataService(
      _repos.addStories(
          AddStoryRequest(desc: desc, photoPath: File(photoPath).path)),
      onSuccess: (_) {
        _homeController.onRefreshPage();
        goRouter.goNamed('home');
      },
    );
  }
}
