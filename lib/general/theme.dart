import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeAX = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
    background: Colors.black,
    onPrimary: Colors.orange,    
    brightness: Brightness.dark,
    
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent
  ),
  textTheme: TextTheme(    
    titleLarge: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold
    ),
    bodyMedium: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500
    ),
    displaySmall: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.normal
    ),
  ),
);
