import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/core/models/ui_state.dart';
import 'package:story_app/app/core/values/constants.dart';
import 'package:story_app/app/data/models/requests/story_request.dart';
import 'package:story_app/app/data/models/response/stories_response.dart';
import 'package:story_app/app/data/repository/story_repository.dart';
import 'package:geocoding/geocoding.dart' as geo;

class MapsController extends BaseController {
  final Completer<GoogleMapController> ctx = Completer();
  late GoogleMapController mapsController;

  final StoryRepository _repos = Get.find(tag: (StoryRepository).toString());

  final markers = <Marker>[].obs;

  final _story = Story().obs;
  Rx<Story> get story => _story;

  final _place = const Placemark().obs;
  Rx<Placemark> get place => _place;

  final isShowBadge = false.obs;

  @override
  void onInit() async {
    mapsController = await ctx.future;
    getListStory();
    super.onInit();
  }

  void getListStory() async {
    callDataService(
      _repos.getStories(StoryRequest(
          page: Constants.defaultPage.toString(),
          size: Constants.defaultSize.toString())),
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
            onTap: () => _showBadge(response![i]),
          ));
        }

        if (markers.length > 1) {
          var latLngList = <LatLng>[];
          for (var element in markers) {
            latLngList.add(element.position);
          }
          mapsController.animateCamera(
              CameraUpdate.newLatLngBounds(getBounds(latLngList), 50));
        } else {
          mapsController.animateCamera(
              CameraUpdate.newLatLngZoom(markers[0].position, 17.0));
        }
      },
    );
  }

  LatLngBounds getBounds(List<LatLng> markerLocations) {
    List<double> lngs =
        markerLocations.map<double>((m) => m.longitude).toList();
    List<double> lats = markerLocations.map<double>((m) => m.latitude).toList();

    double topMost = lngs.reduce(max);
    double leftMost = lats.reduce(min);
    double rightMost = lats.reduce(max);
    double bottomMost = lngs.reduce(min);

    LatLngBounds bounds = LatLngBounds(
      northeast: LatLng(rightMost, topMost),
      southwest: LatLng(leftMost, bottomMost),
    );

    return bounds;
  }

  void _showBadge(Story response) async {
    isShowBadge(true);

    _story(response);
    updateUiState(UiState.loading);
    var info = await geo.placemarkFromCoordinates(response.lat!, response.lon!);
    _place(info[0]);
    updateUiState(UiState.defaults);
    debugPrint('TEST badge ${info[0].subLocality}, ${info[0].locality}');
  }
}
