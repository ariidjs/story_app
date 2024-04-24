import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:location/location.dart';
import 'package:story_app/app/core/models/ui_state.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:story_app/app/data/models/requests/add_story_request.dart';
import 'package:story_app/app/data/repository/story_repository.dart';
import 'package:story_app/app/features/add_story/models/add_models.dart';
import 'package:story_app/app/features/home/controllers/home_controller.dart';
import 'package:story_app/app/routes/app_routes.dart';

class PickerController extends BaseController {
  final pickerLatLng = const LatLng(0.0, 0.0).obs;
  final isShowPicker = false.obs;
  final address = ''.obs;

  final StoryRepository _repos = Get.find(tag: (StoryRepository).toString());
  final HomeController _homeController = Get.find();

  void getAddress() async {
    updateUiState(UiState.loading);
    var info = await geo.placemarkFromCoordinates(
        pickerLatLng.value.latitude, pickerLatLng.value.longitude);
    address.value =
        '${info[0].subLocality}, ${info[0].locality}, ${info[0].postalCode}, ${info[0].country}';
    isShowPicker.value = true;
    updateUiState(UiState.defaults);
  }

  void getDeviceLocation(GoogleMapController mapsController) async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    updateUiState(UiState.loading);
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        debugPrint("Location services is not available");
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        debugPrint("Location permission is denied");
        return;
      }
    }

    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);
    mapsController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
    updateUiState(UiState.defaults);
  }

  void postStoryWithLocation(AddModels data) async {
    debugPrint('TEST ${pickerLatLng.value.latitude}');
    callDataService(
      _repos.addStories(
        AddStoryRequest(
            desc: data.desc,
            photoPath: File(data.photoPath).path,
            lat: pickerLatLng.value.latitude.toString(),
            long: pickerLatLng.value.longitude.toString()),
      ),
      onSuccess: (_) {
        _homeController.onRefreshPage();
        goRouter.goNamed('home');
      },
    );
  }
}
