import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/values/app_styles.dart';
import 'package:story_app/app/features/maps/controllers/maps_controller.dart';

import 'widgets/badge.dart';

class MapsScreen extends BaseView<MapsController> {
  MapsScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  final dicodingOffice = const LatLng(-6.8957473, 107.6337669);
  @override
  Widget body(BuildContext context) {
    debugPrint('TEST MAPS ${controller.markers}');
    return Stack(
      children: [
        Obx(
          () => GoogleMap(
            initialCameraPosition: CameraPosition(
              zoom: 18,
              target: dicodingOffice,
            ),
            onMapCreated: (ctx) {
              controller.ctx.complete(ctx);
            },
            // onCameraMove: (position) => debugPrint('TEST ==${position.target}'),
            // onCameraIdle: () => debugPrint('TEST IDLE'),
            markers: controller.markers.toSet(),
            onTap: (_) => controller.isShowBadge(false),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.topStart,
          margin: EdgeInsets.only(left: 8, top: 8),
          child: IconButton.filled(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
            color: AppColors.colorWhite,
            style: primaryBtn,
          ),
        ),
        Obx(
          () => AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              left: 0,
              right: 0,
              bottom: controller.isShowBadge.value ? 20 : 0,
              child: controller.isShowBadge.value
                  ? MapBottomPill(
                      data: controller.story.value,
                      place: controller.place.value,
                    )
                  : Container()),
        ),
        // Container(
        //   alignment: AlignmentDirectional.topEnd,
        //   margin: EdgeInsets.only(right: 16, top: 16),
        //   child: IconButton.filled(
        //     onPressed: () => controller.mapsController.animateCamera(
        //         CameraUpdate.newLatLng(LatLng(-6.200000, 106.816666))),
        //     icon: Icon(Icons.my_location),
        //     color: AppColors.colorWhite,
        //     style: primaryBtn,
        //   ),
        // ),
        // Center(
        //   child: Padding(
        //     padding: const EdgeInsets.only(bottom: 24.0),
        //     child: AnimatedPin(
        //       child: Icon(
        //         Icons.place,
        //         size: 36,
        //         color: AppColors.colorOnPrimary,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
