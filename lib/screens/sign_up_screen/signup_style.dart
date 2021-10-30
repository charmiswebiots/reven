import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reven/global/packages/config_package.dart';

class SignupCodeStyle {
  final sendButtonStyle =
      TextStyle(color: Colors.white, fontSize: appScreenUtil.fontSize(16));

  final appBarTitleStyle = TextStyle(
      color: appColor.whiteColor, fontFamily: GoogleFonts.poppins().fontFamily);

  // Button Text Style
  final btnTextstyle = TextStyle(
      color: Colors.white,
      letterSpacing: 0.5,
      fontSize: appScreenUtil.fontSize(14),
      fontFamily: GoogleFonts.poppins().fontFamily);

  final signupTitle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.5,fontFamily: GoogleFonts.roboto().fontFamily);

  titleTextStyle(color, fontWeight, letterSpacing, fontSize) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontSize: appScreenUtil.fontSize(fontSize),fontFamily: GoogleFonts.roboto(fontWeight: FontWeight.bold).fontFamily);
  }

  //already have account Style
  final alreadyAccountStyle = TextStyle(
      color: appColor.primaryColor,
      fontSize: appScreenUtil.fontSize(14),
      fontWeight: FontWeight.w400,fontFamily: GoogleFonts.poppins().fontFamily,);

  //signin Style
  final signInStyle = TextStyle(
      color: appColor.primaryColor,
      fontSize: appScreenUtil.fontSize(14),
      fontWeight: FontWeight.w700,fontFamily: GoogleFonts.poppins().fontFamily,);

  tryAnotherWayTextStyle(
      color, fontWeight, letterSpacing, fontSize, decoration) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: decoration,
        fontSize: appScreenUtil.fontSize(fontSize));
  }
}
