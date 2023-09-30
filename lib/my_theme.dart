import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static const Color primary = Color(0xFF0B7935F);
  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color blackColor = Color(0xFF242424);
  static const Color darkBlack = Color(0xff1c0b0b);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color yellowColor = Color(0xFFFACC1D);
  static const Color darkYellow = Color(0xFFddaa01);

  static ThemeData lightTheme = ThemeData(
      // colorScheme: const ColorScheme(
      //     brightness: Brightness.light,
      //     primary: primary,
      //     onPrimary: Colors.black54,
      //     secondary: blackColor,
      //     onSecondary: Colors.white,
      //     error: Colors.red,
      //     onError: Colors.white,
      //     background: primary,
      //     onBackground: Colors.grey,
      //     surface: Colors.blueGrey,
      //     onSurface: Colors.white
      // ),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: blackColor),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
          bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: blackColor,
          ),
          bodySmall: GoogleFonts.elMessiri(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: blackColor,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: primary,
        selectedItemColor: blackColor,
        unselectedItemColor: whiteColor,
      ));
  static ThemeData darkTheme = ThemeData(
      // colorScheme: const ColorScheme(
      //     brightness: Brightness.dark,
      //     primary: darkPrimary,
      //     onPrimary: Colors.white,
      //     secondary: yellowColor,
      //     onSecondary: Colors.white,
      //     error: Colors.red,
      //     onError: Colors.white,
      //     background: yellowColor,
      //     onBackground: Colors.grey,
      //     surface: Colors.blueGrey,
      //     onSurface: Colors.white
      // ),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: whiteColor),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
          bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: yellowColor,
          ),
          bodySmall: GoogleFonts.elMessiri(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: whiteColor,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: darkPrimary,
        selectedItemColor: yellowColor,
        unselectedItemColor: whiteColor,
      ));
}
