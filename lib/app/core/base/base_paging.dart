import 'package:story_app/app/core/values/constants.dart';

class PagingController<T> {
  List<T> listItems = [];
  int pageNumber = Constants.defaultPage;
  bool isLoadingPage = false;
  bool endOfList = false;

  initRefresh() {
    listItems = [];
    pageNumber = Constants.defaultPage;
    isLoadingPage = false;
    endOfList = false;
  }

  bool canLoadNextPage() {
    return !isLoadingPage && !endOfList;
  }

  appendPage(List<T> items) {
    listItems.addAll(items);
    pageNumber++;
  }

  appendLastPage(List<T> items) {
    listItems.addAll(items);
    endOfList = true;
  }
}
