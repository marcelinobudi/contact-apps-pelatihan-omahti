import 'package:flutter/material.dart';

const Color baseColor = Color.fromARGB(255, 248, 140, 54);
final ColorScheme kColorScheme = ColorScheme.fromSeed(
  seedColor: baseColor,
  brightness: Brightness.light,
);
final ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: baseColor,
  brightness: Brightness.dark,
);

const List<Color> profilBackgroundColorList = [
  Color.fromARGB(255, 157, 122, 100),
  Color.fromARGB(255, 157, 179, 61),
  Color.fromARGB(255, 60, 134, 188),
  Color.fromARGB(255, 181, 64, 166),
  Color.fromARGB(255, 186, 143, 106),
];

/// buat background foto profil, soalnya untuk sekarang kita ga pakai foto user beneran.
