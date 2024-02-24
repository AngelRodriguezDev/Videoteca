import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeAX = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
    background: Color.fromRGBO(17, 17, 46, 1),
    onPrimary: Colors.orange,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.poppins(
        color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.poppins(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    bodyMedium: GoogleFonts.poppins(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
    bodySmall: GoogleFonts.poppins(
        color: Colors.white, fontSize: 10, fontWeight: FontWeight.normal),
  ),
);
