import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xFF75018E);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color secondaryColor = Color(0xFFE7E4FD);
  static const Color greyButtonColor = Color(0xFFD9D9D9);
  static const Color primaryDark = Color(0xFF060032);
  

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryDark,
    scaffoldBackgroundColor:  backgroundColor,
    primaryColorLight: secondaryColor,
    canvasColor: greyButtonColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontFamily: 'Gotham-Black', fontSize: 32),
      titleSmall: TextStyle(fontFamily: 'Gothem-Bold', fontSize: 24),
      bodyMedium: TextStyle(fontFamily: 'GothamMedium', fontSize: 16),
      bodySmall: TextStyle(fontFamily: 'Gotham-Light', fontSize: 14),
      labelSmall: TextStyle(fontFamily: 'GothamMedium', fontSize: 16, fontStyle: FontStyle.italic),
      labelMedium: TextStyle(fontFamily: 'Gotham-Light', fontSize: 14, fontStyle: FontStyle.italic),
    ),
  );
}
