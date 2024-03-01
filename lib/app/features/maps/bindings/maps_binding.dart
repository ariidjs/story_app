import 'package:get/get.dart';
import 'package:story_app/app/features/maps/controllers/maps_controller.dart';

class MapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapsController>(() => MapsController(), fenix: true);
  }
}
