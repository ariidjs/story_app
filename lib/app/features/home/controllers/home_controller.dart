import 'package:get/get.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/data/models/response/stories_response.dart';
import 'package:story_app/app/data/repository/story_repository.dart';

class HomeController extends BaseController {
  final StoryRepository _repos = Get.find(tag: (StoryRepository).toString());

  final isReadMore = true.obs;

  final RxList<ListStory> _storiesController = RxList.empty();
  List<ListStory> get stories => _storiesController.toList();

  @override
  void onInit() {
    getStories();
    super.onInit();
  }

  void getStories() async {
    callDataService(
      _repos.getStories(),
      onSuccess: (response) => _storiesController(response),
    );
  }
}
