import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/constants/routes.dart';

/// [AppRouter]
/// This the base router to handle routes
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutePaths.startup:
      //   return MaterialPageRoute(builder: (_) => const StartupView());
      // case RoutePaths.home:
      //   return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}