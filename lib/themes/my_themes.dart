import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:velocity_x/velocity_x.dart";

class MyThemes {
  static Color bluishColor = Color(0xff403b58);
  static Color creamishColor = Color(0xFF5F5F5F5);
  static Color darkCreamColor = Vx.gray900;
  static Color lightBluishColor = Vx.indigo500;
  static lightTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff403b58), //For Buttons
          // ignore: use_full_hex_values_for_flutter_colors
          onPrimary: creamishColor, //For Text On Buttons
          secondary: creamishColor,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.yellow,
          onBackground: Vx.gray900,
          surface: Vx.gray900, //For Back
          onSurface: Color(0xff403b58),
          //For Text on the Surface
        ),
      );
  static darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.black,
          // ignore: use_full_hex_values_for_flutter_colors
          onPrimary: creamishColor,
          secondary: creamishColor,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.white,
          onBackground: Vx.gray900,
          surface: Colors.greenAccent,
          onSurface: Colors.blueGrey));
}
