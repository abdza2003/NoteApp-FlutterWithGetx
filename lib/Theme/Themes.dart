import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleproject/Theme/ThemeController.dart';

class Themes {
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Color.fromARGB(255, 0, 127, 139), // <-- SEE HERE
      onPrimary: Colors.white, // <-- SEE HERE
      onSurface: Colors.black, // <-- SEE HERE
    ),
    scaffoldBackgroundColor: Color.fromARGB(255, 223, 226, 228),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: GoogleFonts.secularOne(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      backgroundColor: Color.fromARGB(255, 223, 226, 228),
      centerTitle: true,
      elevation: 0,
    ),
  );
  final ThemeData darkTheme = ThemeData(
    // brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color.fromARGB(255, 0, 127, 139), // <-- SEE HERE
      onPrimary: Colors.white, // <-- SEE HERE
      onSurface: Colors.white, // <-- SEE HERE
      surface: Color.fromARGB(255, 53, 52, 52),
    ),
    scaffoldBackgroundColor: Color.fromARGB(255, 53, 52, 52),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: GoogleFonts.secularOne(
        color: Colors.white,
        fontSize: 25,
      ),
      backgroundColor: Color.fromARGB(255, 53, 52, 52),
      centerTitle: true,
      elevation: 0,
    ),
  );

  TextStyle get headLine1 {
    return GoogleFonts.secularOne(
      fontSize: 25,
      color: Colors.white,
    );
  }

  TextStyle get headLine2 {
    return GoogleFonts.openSans(
      fontSize: 20,
      color: Colors.white,
    );
  }

  TextStyle get headLine3 {
    return GoogleFonts.secularOne(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      color: ThemeController().themeApp == ThemeMode.light
          ? Colors.black
          : Colors.white,
    );
  }
}
