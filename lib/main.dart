import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_food_purchase/splash_intro_screen/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.from(colorScheme: ColorScheme.light()).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(400, 40),
            textStyle: GoogleFonts.abel(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            backgroundColor: Colors.lightGreen,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                style: BorderStyle.solid,
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Splash_screen(),
    ),
  );
}
