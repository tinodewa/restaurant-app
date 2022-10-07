import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF356859);
const Color primaryMediumColor = Color(0xFF37966F);
const Color primaryLightColor = Color(0xFFB9E4C9);
const Color secondaryColor = Color(0xFFFD5523);
const Color whiteColor = Color(0xFFFFFBE6);
const Color darkPrimaryColor = Color(0xFF2c3e50);
const Color darkSecondaryColor = Color(0xFF356859);

final TextTheme restaurantTextTheme = TextTheme(
  headline1: GoogleFonts.montserrat(
      fontSize: 82, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.montserrat(
      fontSize: 51, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.montserrat(fontSize: 41, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.montserrat(
      fontSize: 29, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.montserrat(
      fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.montserrat(
      fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.lekton(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.lekton(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.lekton(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.lekton(
      fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.lekton(
      fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(elevation: 0),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        onPrimary: darkPrimaryColor,
      ),
  textTheme: restaurantTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryLightColor,
      foregroundColor: whiteColor,
      textStyle: const TextStyle(color: darkPrimaryColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(elevation: 0),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: darkPrimaryColor,
        secondary: darkSecondaryColor,
        onPrimary: darkPrimaryColor,
      ),
  textTheme: restaurantTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryLightColor,
      foregroundColor: whiteColor,
      textStyle: const TextStyle(color: whiteColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    ),
  ),
);
