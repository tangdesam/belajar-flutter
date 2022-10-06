import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary700 = Color(0xFF344955);
const Color primary800 = Color(0xFF232F34);
const Color primary600 = Color(0xFF4A6572);
const Color secondary500 = Color(0xFFF9AA33);

final TextTheme replyTextTheme = TextTheme(
  headline1: GoogleFonts.workSans(fontSize: 96, fontWeight: FontWeight.w300), // Light
  headline2: GoogleFonts.workSans(fontSize: 60, fontWeight: FontWeight.w600), // SemiBold
  headline3: GoogleFonts.workSans(fontSize: 48, fontWeight: FontWeight.w400), // Regular
  headline4: GoogleFonts.workSans(fontSize: 34, fontWeight: FontWeight.w400),
  headline5: GoogleFonts.workSans(fontSize: 24, fontWeight: FontWeight.w700), // Bold
  headline6: GoogleFonts.workSans(fontSize: 20, fontWeight: FontWeight.w500), // Medium
  subtitle1: GoogleFonts.workSans(fontSize: 16, fontWeight: FontWeight.w400),
  subtitle2: GoogleFonts.workSans(fontSize: 24, fontWeight: FontWeight.w500),
  bodyText1: GoogleFonts.workSans(fontSize: 18, fontWeight: FontWeight.w400),
  bodyText2: GoogleFonts.workSans(fontSize: 14, fontWeight: FontWeight.w400),
  button: GoogleFonts.workSans(fontSize: 14, fontWeight: FontWeight.w500),
  caption: GoogleFonts.workSans(fontSize: 12, fontWeight: FontWeight.w400),
  overline: GoogleFonts.workSans(fontSize: 12, fontWeight: FontWeight.w600,), // WorkSans SemiBold 12 CAPS
);
