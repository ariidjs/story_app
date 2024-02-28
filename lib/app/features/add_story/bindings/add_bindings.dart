import 'package:get/get.dart';
import 'package:story_app/app/features/add_story/controllers/add_controller.dart';

class AddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddController>(() => AddController(), fenix: true);
  }
}
