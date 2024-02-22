import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app/app/routes/app_routes.dart';

import 'bindings/initial_bindings.dart';
import 'core/values/app_colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Story App',
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      routeInformationProvider: goRouter.routeInformationProvider,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        primaryColor: AppColors.colorPrimary,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.colorPrimary,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black87),
        ),
        textTheme: Theme.of(context).textTheme,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
