import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static const Color primary = Color(0xFF0B7935F);
  static const Color blackColor = Color(0xFF242424);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static ThemeData lightTheme = ThemeData(
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
  static ThemeData darkTheme = ThemeData();
}
