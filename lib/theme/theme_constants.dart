import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle navBarTextStyle(Set<MaterialState> states) {
  if (states.contains(MaterialState.selected)) {
    return const TextStyle(color: Colors.white, fontWeight: FontWeight.w500);
  } else {
    return TextStyle(color: Colors.grey[400]);
  }
}

IconThemeData navBarIconThemeData(Set<MaterialState> states) {
  if (states.contains(MaterialState.selected)) {
    return const IconThemeData(color: Colors.white);
  } else {
    return IconThemeData(color: Colors.grey[400]);
  }
}

Color checkBoxInnerColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.selected)) {
    return const Color.fromRGBO(26, 135, 244, 1);
  } else {
    return const Color.fromARGB(16, 16, 16, 1);
  }
}

Color radioOuterColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.selected)) {
    return Colors.white;
  }
  return Colors.white;
}

final darkTheme = ThemeData(
  primaryColor: const Color.fromRGBO(255, 0, 255, 1),
  primarySwatch: primaryswatchcolor,
  colorScheme: ColorScheme.fromSwatch(
    backgroundColor: const Color.fromRGBO(25, 25, 25, 1),
    primarySwatch: primaryswatchcolor,
    cardColor: const Color.fromRGBO(33, 33, 33, 1),
    errorColor: const Color.fromARGB(237, 67, 55, 1),
  ),
  fontFamily: "Nunito",
  scaffoldBackgroundColor: const Color.fromRGBO(16, 16, 16, 1),
  cardColor: const Color.fromRGBO(33, 33, 33, 1),
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
    color: Color.fromRGBO(33, 33, 33, 1),
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: "Roboto",
      fontSize: 20,
      fontWeight: FontWeight.bold,
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
      disabledForegroundColor: const Color.fromRGBO(25, 25, 25, 1),
      backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
      surfaceTintColor: Colors.transparent,
      shape: const StadiumBorder(),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      disabledBackgroundColor: Colors.grey[700],
      disabledForegroundColor: const Color.fromRGBO(25, 25, 25, 1),
      backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
      shape: const StadiumBorder(),
      side: const BorderSide(color: Color.fromRGBO(255, 0, 255, 1)),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      disabledBackgroundColor: Colors.grey[700],
      disabledForegroundColor: const Color.fromRGBO(25, 25, 25, 1),
      shape: const StadiumBorder(),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  cardTheme: const CardTheme(
    elevation: 0,
    color: Color.fromRGBO(33, 33, 33, 1),
    surfaceTintColor: Colors.transparent,
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
    contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: TextStyle(color: Colors.grey),
    errorStyle: TextStyle(color: Color.fromRGBO(237, 67, 55, 1)),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  navigationBarTheme: NavigationBarThemeData(
    elevation: 0,
    labelTextStyle: MaterialStateProperty.resolveWith(navBarTextStyle),
    iconTheme: MaterialStateProperty.resolveWith(navBarIconThemeData),
    indicatorColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
  
  ),
  
  tabBarTheme: const TabBarTheme(
    labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white,
  ),
  checkboxTheme: CheckboxThemeData(
      side: const BorderSide(
        color: Colors.white,
      ),
      fillColor: MaterialStateProperty.resolveWith(checkBoxInnerColor)),
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(Colors.white),
  ),
  useMaterial3: true,
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
