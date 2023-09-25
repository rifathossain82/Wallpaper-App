import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/src/core/utils/color.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: kPrimarySwatchColor,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kSecondaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: kSecondaryColor,
      foregroundColor: kWhite,
      elevation: 0.5,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 18,
        color: kWhite,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        /// Status bar brightness (optional)
        statusBarIconBrightness: Brightness.light, // For Android (light icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kPrimaryColor,
      foregroundColor: kWhite,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(Typography.whiteCupertino),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(kPrimaryColor),
      checkColor: MaterialStatePropertyAll(kWhite),
      side: BorderSide(color: kGrey),
    ),
    cardTheme: CardTheme(
      color: kWhite,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    iconTheme: IconThemeData(
      color: kGrey,
    ),
  );
}
