import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle navBarTextStyle(Set<MaterialState> states) {
  if (states.contains(MaterialState.selected)) {
    return TextStyle(color: Colors.white, fontWeight: FontWeight.w500);
  } else {
    return TextStyle(color: Colors.grey[400]);
  }
}

IconThemeData navBarIconThemeData(Set<MaterialState> states) {
  if (states.contains(MaterialState.selected)) {
    return IconThemeData(color: Colors.white);
  } else {
    return IconThemeData(color: Colors.grey[400]);
  }
}

final dark_theme = ThemeData(
  primaryColor: Color.fromRGBO(255, 0, 255, 1),
  primarySwatch: primaryswatchcolor,
  errorColor: Color.fromRGBO(237, 67, 55, 1),
  fontFamily: "Nunito",
  scaffoldBackgroundColor: Color.fromRGBO(16, 16, 16, 1),
  cardColor: Color.fromRGBO(33, 33, 33, 1),
  appBarTheme: AppBarTheme(
    foregroundColor: Colors.white,
    backgroundColor: Color.fromRGBO(33, 33, 33, 1),
    elevation: 5,
    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    titleTextStyle: TextStyle(fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
    ),
  ),
  textTheme: GoogleFonts.nunitoTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
    decorationColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: Colors.grey[700],
      disabledForegroundColor: Color.fromRGBO(16, 16, 16, 1),
      shape: StadiumBorder(),
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      disabledBackgroundColor: Colors.grey[700],
      disabledForegroundColor: Color.fromRGBO(16, 16, 16, 1),
      backgroundColor: Color.fromRGBO(33, 33, 33, 1),
      shape: StadiumBorder(),
      side: BorderSide(color: Color.fromRGBO(255, 0, 255, 1)),
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      disabledBackgroundColor: Colors.grey[700],
      disabledForegroundColor: Color.fromRGBO(16, 16, 16, 1),
      shape: StadiumBorder(),
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  cardTheme: const CardTheme(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    helperStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
    border: OutlineInputBorder(),
    labelStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(237, 67, 55, 1)),
    ),
    contentPadding: EdgeInsets.all(16),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: TextStyle(color: Colors.grey),
    errorStyle: TextStyle(color: Color.fromRGBO(237, 67, 55, 1)),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  navigationBarTheme: NavigationBarThemeData(
    elevation: 5,
    labelTextStyle: MaterialStateProperty.resolveWith(navBarTextStyle),
    iconTheme: MaterialStateProperty.resolveWith(navBarIconThemeData),
  ),
  // useMaterial3: true,
);
const MaterialColor primaryswatchcolor =
    MaterialColor(_primaryswatchcolorPrimaryValue, <int, Color>{
  50: Color(0xFFFFE0FF),
  100: Color(0xFFFFB3FF),
  200: Color(0xFFFF80FF),
  300: Color(0xFFFF4DFF),
  400: Color(0xFFFF26FF),
  500: Color(_primaryswatchcolorPrimaryValue),
  600: Color(0xFFFF00FF),
  700: Color(0xFFFF00FF),
  800: Color(0xFFFF00FF),
  900: Color(0xFFFF00FF),
});
const int _primaryswatchcolorPrimaryValue = 0xFFFF00FF;
