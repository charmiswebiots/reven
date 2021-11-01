import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reven/global/packages/config_package.dart';

class VerifyByCodeStyle {

  //forgot password text style
  final forgotpasswordTextStyle =
  TextStyle(color: Color(0xFF265DCD), fontWeight: FontWeight.w500);

  final resendCodeStyle = TextStyle(
      color: appColor.primaryDarkColor, fontSize: appScreenUtil.fontSize(14),
      fontFamily: GoogleFonts.poppins().fontFamily,);

  final sendButtonStyle =TextStyle(
      color: Colors.white, fontSize: appScreenUtil.fontSize(14),
    fontFamily: GoogleFonts.poppins().fontFamily,);

  final appBarTitleStyle = TextStyle(
    color: appColor.primaryColor,
  );


  titleTextStyle(color, fontWeight, letterSpacing, fontSize) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontSize: appScreenUtil.fontSize(fontSize),
      fontFamily: GoogleFonts.roboto(fontWeight: FontWeight.bold).fontFamily,);
  }

  descriptionTextStyle(color, fontWeight, letterSpacing, fontSize) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontSize: appScreenUtil.fontSize(fontSize),
      fontFamily: GoogleFonts.roboto().fontFamily,);
  }

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
