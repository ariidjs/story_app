import 'dart:io';

import 'package:get/get.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/data/models/requests/add_story_request.dart';
import 'package:story_app/app/data/repository/story_repository.dart';
import 'package:story_app/app/features/home/controllers/home_controller.dart';
import 'package:story_app/app/routes/app_routes.dart';

class AddController extends BaseController {
  final StoryRepository _repos = Get.find(tag: (StoryRepository).toString());
  final HomeController _homeController = Get.find();
  void addStory(String desc, String photoPath) async {
    if (desc.isNotEmpty) {
      callDataService(
        _repos.addStories(
            AddStoryRequest(desc: desc, photoPath: File(photoPath).path)),
        onSuccess: (_) {
          _homeController.getStories();
          goRouter.goNamed('home');
        },
      );
    } else {
      showErrorMessage(AppLocalizations.of(Get.context!)!.fillRequiredData);
    }
  }
}
