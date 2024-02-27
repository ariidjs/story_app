import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/services/auth_service.dart';
import 'package:story_app/app/features/auth/screens/auth_screen.dart';
import 'package:story_app/app/features/home/screens/home_screen.dart';
import 'package:story_app/app/features/splash/screen/splash_screen.dart';
import 'package:story_app/app/routes/go_router_refresh_stream.dart';

final goRouter = GoRouter(
  navigatorKey: Get.key,
  initialLocation: '/',
  debugLogDiagnostics: true,
  refreshListenable:
      GoRouterRefreshStream(injector.get<AuthService>().authState.stream),
  redirect: (context, state) {
    final auth = injector.get<AuthService>();
    debugPrint('TEST ${auth.authState.value}');
    if (auth.authState.value == AuthState.loggedIn) {
      return '/home';
    } else if (auth.authState.value == AuthState.loggedOut) {
      return '/auth';
    } else {
      return '/';
    }
  },
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      parentNavigatorKey: Get.key,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) => AuthScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
