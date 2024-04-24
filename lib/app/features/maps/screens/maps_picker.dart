import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/features/add_story/models/add_models.dart';
import 'package:story_app/app/features/maps/controllers/picker_controller.dart';
import 'package:story_app/app/features/maps/screens/widgets/picker_baloon.dart';

import 'widgets/animated_pin.dart';

// ignore: must_be_immutable
class MapsPicker extends BaseView<PickerController> {
  final AddModels data;

  MapsPicker({super.key, required this.data});
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  final dicodingOffice = const LatLng(-6.8957473, 107.6337669);
  late GoogleMapController mapController;
  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            zoom: 18,
            target: dicodingOffice,
          ),
          onMapCreated: (ctx) {
            mapController = ctx;
            controller.getDeviceLocation(ctx);
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          onCameraMove: (position) {
            controller.pickerLatLng.value = position.target;
            controller.isShowPicker.value = false;
          },
          onCameraIdle: () => controller.getAddress(),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.colorWhite),
            child: IconButton(
              icon: const Icon(
                Icons.my_location,
                color: AppColors.colorBlue,
              ),
              onPressed: () => controller.getDeviceLocation(mapController),
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.colorWhite),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.colorOnPrimary,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: AnimatedPin(
              child: Icon(
                Icons.place,
                size: 36,
                color: AppColors.colorOnPrimary,
              ),
            ),
          ),
        ),
        Obx(
          () => AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              left: 0,
              right: 0,
              bottom: controller.isShowPicker.value ? 20 : 0,
              child: controller.isShowPicker.value
                  ? PickerBaloon(
                      onPick: () => controller.postStoryWithLocation(data),
                      address: controller.address.value,
                    )
                  : const SizedBox()),
        ),
      ],
    );
  }
}
