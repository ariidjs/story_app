import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:story_app/app/core/base/base.dart';

class MapsController extends BaseController {
  final Completer<GoogleMapController> ctx = Completer();
  late GoogleMapController mapsController;

  @override
  void onInit() async {
    mapsController = await ctx.future;
    super.onInit();
  }

  void initMaps() async {}
}
