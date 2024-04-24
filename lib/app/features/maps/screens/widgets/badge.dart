import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:story_app/app/core/models/ui_state.dart';
import 'package:story_app/app/core/values/app_colors.dart';
import 'package:story_app/app/core/widget/loading.dart';
import 'package:story_app/app/data/models/response/stories_response.dart';
import 'package:story_app/app/features/maps/controllers/maps_controller.dart';

class MapBottomPill extends StatelessWidget {
  final Story data;
  final Placemark place;

  const MapBottomPill({super.key, required this.data, required this.place});
  @override
  Widget build(BuildContext context) {
    final MapsController controller = Get.find();
    return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset.zero)
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border:
                          Border.all(color: AppColors.colorBlack, width: 4)),
                  child: ClipOval(
                    child: Image.network(data.photoUrl ?? ''),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(data.name ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Text('Dicoding Academy'),
                      Obx(
                        () => controller.uiState == UiState.loading
                            ? const Loading()
                            : Text(
                                '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}'),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
