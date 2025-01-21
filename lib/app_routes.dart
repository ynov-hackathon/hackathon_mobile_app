import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/constants/routes.dart';
import 'package:hackathon_mobile_app/views/home/home_view.dart';
import 'package:hackathon_mobile_app/views/login/login_view.dart';
import 'package:hackathon_mobile_app/views/product_details/product_details_view.dart';

/// [AppRouter]
/// This the base router to handle routes
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}