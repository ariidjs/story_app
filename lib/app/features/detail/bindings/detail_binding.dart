import 'package:get/get.dart';
import 'package:story_app/app/features/detail/controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController(), fenix: true);
  }
}
