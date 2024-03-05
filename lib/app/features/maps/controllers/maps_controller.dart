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

  final Set<Marker> _markers = <Marker>{}.obs;
  Set<Marker> get markers => _markers;

  @override
  void onInit() async {
    mapsController = await ctx.future;

    super.onInit();
  }

  void getListStory() {
    callDataService(
      _repos.getStories(),
      onSuccess: (response) async {
        var list = response
            ?.where((element) => element.lon != null && element.lat != null)
            .toList();
        for (int i = 0; i < list!.length; i++) {
          debugPrint('TEST maps ${list[i].name}');
          var latLng = LatLng(list[i].lat!, list[i].lon!);
          final marker = Marker(
            markerId: const MarkerId("story"),
            position: latLng,
            // infoWindow: InfoWindow(
            //   title: street,
            //   snippet: address,
            // ),
          );

          _markers.add(marker);
        }
      },
    );
  }

  // Future<List<Placemark>> _getAddress() async {
  //   return await geo.placemarkFromCoordinates(
  //       dicodingOffice.latitude, dicodingOffice.longitude);
  // }
}
