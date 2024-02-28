import 'package:get/get.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/data/models/response/stories_response.dart';
import 'package:story_app/app/data/repository/story_repository.dart';

class DetailController extends BaseController {
  final StoryRepository _repos = Get.find(tag: (StoryRepository).toString());

  final Rx<Story> _story = Story().obs;
  Story get story => _story.value;

  void getDetail(String id) {
    callDataService(_repos.detailStories(id), onSuccess: _story);
  }
}
