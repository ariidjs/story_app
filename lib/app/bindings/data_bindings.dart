import 'package:get/get.dart';
import 'package:story_app/app/data/remote/remote_data_source.dart';
import 'package:story_app/app/data/repository/story_repository.dart';

class DataBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSource(),
        tag: (RemoteDataSource).toString(), fenix: true);
    Get.lazyPut<StoryRepository>(() => StoryRepository(),
        tag: (StoryRepository).toString(), fenix: true);
  }
}
