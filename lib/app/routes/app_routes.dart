import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/services/auth_service.dart';
import 'package:story_app/app/features/auth/bindings/auth_bindings.dart';
import 'package:story_app/app/features/auth/screens/auth_screen.dart';
import 'package:story_app/app/features/home/bindings/home_binding.dart';
import 'package:story_app/app/features/home/screens/home_screen.dart';
import 'package:story_app/app/features/splash/bindings/splash_binding.dart';
import 'package:story_app/app/features/splash/controllers/splash_controller.dart';
import 'package:story_app/app/features/splash/screen/splash_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  refreshListenable: injector.get<AuthService>(),
  redirect: (context, state) {
    // final auth = injector.get<AuthService>();
    // if (auth.authState == AuthState.loggedIn) {
    //   return '/home';
    // } else {
    //   return '/auth';
    // }
  },
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      // builder: (context, state) => SplashScreen(),
      pageBuilder: (context, state) => GetPage(
        name: '/test',
        page: () => SplashScreen(),
        binding: SplashBinding(),
      ),
    ),
    // GoRoute(
    //   path: '/',
    //   name: 'splash',
    //   pageBuilder: (context, state) => GetPage(
    //     name: '/splash',
    //     page: () => SplashScreen(),
    //     binding: SplashBinding(),
    //   ),
    // ),
    // GoRoute(
    //   path: '/auth',
    //   name: 'auth',
    //   pageBuilder: (context, state) => GetPage(
    //     name: '/auth',
    //     page: () => AuthScreen(),
    //     binding: AuthBinding(),
    //   ),
    // ),
    // GoRoute(
    //   path: '/home',
    //   name: 'home',
    //   pageBuilder: (context, state) => GetPage(
    //     name: '/home',
    //     page: () => HomeScreen(),
    //     binding: HomeBinding(),
    //   ),
    // ),
    // GoRoute(
    //     path: '/home',
    //     name: 'home',
    //     builder: (context, state) => const HomeScreen(),
    //     routes: [
    //       GoRoute(
    //           path: 'profile',
    //           name: 'profile',
    //           builder: (context, state) => const ProfileScreen())
    //     ])
  ],
);
