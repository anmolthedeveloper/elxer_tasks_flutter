import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  ThemeData get lightThemeData {
    ThemeData theme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: primaryWhiteColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlackColor,
      ),
      primaryColor: primaryGreenThemeColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryGreenThemeColor.withOpacity(.5),
        selectionColor: primaryGreenThemeColor.withOpacity(.5),
        selectionHandleColor: primaryGreenThemeColor,
      ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: primaryBlackColor,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        titleMedium: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: primaryBlackColor,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        titleSmall: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: primaryBlackColor,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
    return theme;
  }
}
