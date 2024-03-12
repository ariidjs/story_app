import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/base/base_paging.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/services/auth_service.dart';
import 'package:story_app/app/core/values/constants.dart';
import 'package:story_app/app/data/models/requests/story_request.dart';
import 'package:story_app/app/data/models/response/stories_response.dart';
import 'package:story_app/app/data/repository/story_repository.dart';

class HomeController extends BaseController {
  final StoryRepository _repos = Get.find(tag: (StoryRepository).toString());

  final isReadMore = true.obs;

  final RxList<Story> _storiesController = RxList.empty();
  List<Story> get stories => _storiesController.toList();

  final authService = injector.get<AuthService>();

  final storyPagingController = PagingController<Story>();

  @override
  void onInit() {
    getStories();
    super.onInit();
  }

  void getStories() async {
    if (!storyPagingController.canLoadNextPage()) return;
    storyPagingController.isLoadingPage = true;

    callDataService(
      _repos.getStories(StoryRequest(
          page: storyPagingController.pageNumber.toString(),
          size: Constants.defaultSize.toString())),
      onSuccess: (response) => _handleLists(response!),
    );
    storyPagingController.isLoadingPage = false;
  }

  void signOut() => authService.signOut();

  _handleLists(List<Story> response) {
    if (_isLastPage(response.length, Constants.defaultSize)) {
      storyPagingController.appendLastPage(response);
    } else {
      storyPagingController.appendPage(response);
    }
    var storyList = [...storyPagingController.listItems];
    _storiesController(storyList);
  }

  onRefreshPage() {
    storyPagingController.initRefresh();
    getStories();
  }

  onLoadNextPage() {
    debugPrint("TEST On load next: page-${storyPagingController.pageNumber}");

    getStories();
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return newListItemCount < totalCount;
  }
}
