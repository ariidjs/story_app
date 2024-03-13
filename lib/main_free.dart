import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/flavors/build_config.dart';
import 'package:story_app/flavors/env_config.dart';
import 'package:story_app/flavors/environment.dart';

import 'app/app.dart';

void main() async {
  EnvConfig config =
      EnvConfig(appName: 'Story App (Free)', hasUniqueFeature: false);
  BuildConfig.instantiate(envType: Environment.free, envConfig: config);
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  initDependencies();
  runApp(const MyApp());
}
