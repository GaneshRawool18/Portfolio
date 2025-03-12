import 'package:flutter/material.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black, // Base color (used as fallback)
    primaryColor: Colors.orangeAccent,
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
    ),
  );

  // ✅ Gradient Colors (Light Blue to Black)
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.lightBlueAccent, Colors.black], // ✅ Light Blue to Black
  );
}
