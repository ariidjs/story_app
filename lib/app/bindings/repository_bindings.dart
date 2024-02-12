import 'package:get/get.dart';
import 'package:story_app/app/data/local/local_repository.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepository>(() => LocalRepository(),
        tag: (LocalRepository).toString(), fenix: true);
  }
}
