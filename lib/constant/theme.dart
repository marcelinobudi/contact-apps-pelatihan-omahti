import 'package:contacts/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData themeLight = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: baseColor,
    brightness: Brightness.light,
  ),
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
);
