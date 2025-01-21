import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const ColorSwatch blue = MaterialColor(
    0xFF3197B9,
    <int, Color>{
      50: Color(0xFFB1DCEA),
      100: Color(0xFFA2D5E6),
      200: Color(0xFF83C7DE),
      300: Color(0xFF64B9D6),
      400: Color(0xFF45ABCD),
      500: Color(0xFF3197B9),
      600: Color(0xFF2E8DAC),
      700: Color(0xFF2A829F),
      800: Color(0xFF277792),
      900: Color(0xFF236C84),
    },
  );

  // main color
  static const Color primary = blue;
  static Color primaryLite = blue[400]!;
  static Color primaryDeep = blue[800]!;


  // bins colors
  static const Color yellowBin = Colors.yellow;
  static const Color blueBin = Colors.blue;
  static const Color green = Colors.green;


  static const ColorSwatch red = MaterialColor(
    0xFFE74D3C,
    <int, Color>{
      50: Color(0xFFF6BFB9),
      100: Color(0xFFF5B3AB),
      200: Color(0xFFF1998F),
      300: Color(0xFFEE8074),
      400: Color(0xFFEA6658),
      500: Color(0xFFE74D3C),
      600: Color(0xFFE53C29),
      700: Color(0xFFDE2F1B),
      800: Color(0xFFCB2B19),
      900: Color(0xFFB92717),
    },
  );
  static const Color danger = red;


}