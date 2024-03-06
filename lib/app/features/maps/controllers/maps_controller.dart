import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/data/repository/story_repository.dart';

class MapsController extends BaseController {
  final Completer<GoogleMapController> ctx = Completer();
  late GoogleMapController mapsController;

  final StoryRepository _repos = Get.find(tag: (StoryRepository).toString());

  final markers = <Marker>[].obs;
  // RxList<Marker> get markers => _markers;

  @override
  void onInit() async {
    mapsController = await ctx.future;
    getListStory();
    super.onInit();
  }

  void getListStory() async {
    callDataService(
      _repos.getStories(),
      onSuccess: (response) async {
        var list = response
            ?.where((element) => element.lon != null && element.lat != null)
            .toList();
        for (int i = 0; i < list!.length; i++) {
          debugPrint('TEST maps ${list[i].name}');
          var latLng = LatLng(list[i].lat!, list[i].lon!);

          markers.add(Marker(
            markerId: MarkerId(list[i].id!),
            position: latLng,
            infoWindow: InfoWindow(
              title: list[i].name,
              snippet: list[i].description,
            ),
          ));
        }
        await Future.delayed(Duration(seconds: 3));
        if (markers.length > 1) {
          mapsController.animateCamera(CameraUpdate.newLatLngBounds(
              LatLngBounds(
                  southwest: markers[1].position,
                  northeast: markers[0].position),
              0.0));
        } else {
          mapsController.animateCamera(
              CameraUpdate.newLatLngZoom(markers[0].position, 17.0));
        }
      },
    );
  }

  // Future<List<Placemark>> _getAddress() async {
  //   return await geo.placemarkFromCoordinates(
  //       dicodingOffice.latitude, dicodingOffice.longitude);
  // }
}
