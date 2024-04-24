import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:story_app/app/data/models/response/stories_response.dart';
import 'package:story_app/app/features/maps/controllers/maps_controller.dart';
import 'package:story_app/app/features/maps/screens/widgets/badge.dart';

class MapsWidget extends StatefulWidget {
  final Story story;
  const MapsWidget({super.key, required this.story});

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  late GoogleMapController controller;

  @override
  Widget build(BuildContext context) {
    final MapsController ctx = Get.find();
    final position = LatLng(widget.story.lat!, widget.story.lon!);
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            zoom: 18,
            target: position,
          ),
          onMapCreated: (ctx) {
            controller = ctx;
          },
          markers: {
            Marker(
              markerId: MarkerId(widget.story.id!),
              position: position,
              onTap: () => ctx.showBadge(widget.story),
            )
          },
          onTap: (_) => ctx.isShowBadge(false),
        ),
        Obx(
          () => AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              left: 0,
              right: 0,
              bottom: ctx.isShowBadge.value ? 20 : 0,
              child: ctx.isShowBadge.value
                  ? MapBottomPill(
                      data: widget.story,
                      place: ctx.place.value,
                    )
                  : Container()),
        ),
      ],
    );
  }
}
