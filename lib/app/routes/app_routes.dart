import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_app/app/core/di/injector.dart';
import 'package:story_app/app/core/services/auth_service.dart';
import 'package:story_app/app/features/add_story/screens/preview_screen.dart';
import 'package:story_app/app/features/auth/screens/auth_screen.dart';
import 'package:story_app/app/features/detail/screens/detail_screen.dart';
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
    if (auth.authState.value == AuthState.loggedIn &&
        state.uri.toString() == '/') {
      return '/home';
    } else if (auth.authState.value == AuthState.loggedOut) {
      return '/auth';
    }
    return null;
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
        parentNavigatorKey: Get.key,
        builder: (context, state) => HomeScreen(),
        routes: [
          GoRoute(
            path: 'preview',
            name: 'preview',
            builder: (context, state) => PreviewScreen(
              photoPath: state.extra as String,
            ),
          ),
          GoRoute(
            path: 'detail/:id',
            name: 'detail',
            builder: (context, state) => DetailScreen(
              id: state.pathParameters['id']!,
            ),
          )
        ]),
  ],
);
