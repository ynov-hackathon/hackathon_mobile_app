import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/app_locator.dart';
import 'package:hackathon_mobile_app/app_routes.dart';
import 'package:hackathon_mobile_app/constants/routes.dart';
import 'package:hackathon_mobile_app/constants/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      initialRoute: RoutePaths.login,
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
    );
  }
}