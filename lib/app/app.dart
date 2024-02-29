import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/services/language_controller.dart';
import 'package:story_app/app/routes/app_routes.dart';

import 'bindings/initial_bindings.dart';
import 'core/values/app_colors.dart';
import 'core/values/app_styles.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final langController = injector.get<LanguageController>();
    return GetMaterialApp.router(
      title: 'Story App',
      initialBinding: InitialBinding(),
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      routeInformationProvider: goRouter.routeInformationProvider,
      locale: langController.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        primaryColor: AppColors.colorPrimary,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.colorPrimary,
          elevation: 0,
          titleTextStyle:
              titleTextStyle.copyWith(color: AppColors.colorPrimary),
        ),
        textTheme: Theme.of(context).textTheme,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
