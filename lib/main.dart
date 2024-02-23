import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_app/app/core/di/injector.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  initDependencies();
  runApp(const MyApp());
}
