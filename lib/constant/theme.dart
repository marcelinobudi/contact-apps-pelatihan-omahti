import 'package:contacts/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData themeLight = ThemeData(
  colorScheme: kColorScheme,

  // Text Theme
  textTheme: GoogleFonts.poppinsTextTheme(),

  // Outlined Button Theme
  // By default, using black border color
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: kColorScheme.primary,
      side: BorderSide(color: kColorScheme.primary),
      // backgroundColor: kColorScheme.primary,
    ),
  ),

  // Filled Button
  // we need to adjust border radius
  // by default, Tonal Filled Button using PrimaryContainer
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
);
