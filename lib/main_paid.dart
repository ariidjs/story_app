import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_app/app/core/di/injector.dart';

import 'app/app.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';

void main() async {
  EnvConfig config =
      EnvConfig(appName: 'Story App (Paid)', hasUniqueFeature: true);
  BuildConfig.instantiate(envType: Environment.paid, envConfig: config);
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  initDependencies();
  runApp(const MyApp());
}
