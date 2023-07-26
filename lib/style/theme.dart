import 'package:flutter/material.dart';

final customTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.indigo,
    secondary: Colors.green,
    tertiary: Colors.yellow,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
  ),
  useMaterial3: true,
);

// final customTheme = ThemeData(
//   colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
//   textTheme: const TextTheme(
//     bodyLarge: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
//   ),
//   useMaterial3: true,
// );
