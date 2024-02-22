import 'package:flutter/material.dart';
import 'package:story_app/app/core/di/injector.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const MyApp());
}
