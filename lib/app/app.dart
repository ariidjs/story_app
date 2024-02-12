import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/initial_bindings.dart';
import 'core/values/app_colors.dart';
import 'routes/app_pages.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Story App',
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
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
