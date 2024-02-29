import 'package:get/get.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/services/auth_service.dart';
import 'package:story_app/app/data/models/response/stories_response.dart';
import 'package:story_app/app/data/repository/story_repository.dart';

class HomeController extends BaseController {
  final StoryRepository _repos = Get.find(tag: (StoryRepository).toString());

  final isReadMore = true.obs;

  final RxList<Story> _storiesController = RxList.empty();
  List<Story> get stories => _storiesController.toList();

  final authService = injector.get<AuthService>();

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

  void signOut() => authService.signOut();
}
