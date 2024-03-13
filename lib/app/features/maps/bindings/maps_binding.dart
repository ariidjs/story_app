import 'package:get/get.dart';
import 'package:story_app/app/features/maps/controllers/maps_controller.dart';
import 'package:story_app/app/features/maps/controllers/picker_controller.dart';

class MapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapsController>(() => MapsController());
    Get.lazyPut<PickerController>(() => PickerController());
  }
}
