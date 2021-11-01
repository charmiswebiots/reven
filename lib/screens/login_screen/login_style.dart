import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reven/global/packages/config_package.dart';

class LoginStyle {

// Field Heading Text
  final fieldHeadText =
      TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w200);

// Version Text Style
  final versionStyle = TextStyle(
      color: appColor.textSecondaryColor,
      fontSize: 10.0,
      fontWeight: FontWeight.w500);

// Button Text Style
  final btnTextstyle =
      TextStyle(color: Colors.white, letterSpacing: 0.5, fontSize: appScreenUtil.fontSize(14),fontFamily: GoogleFonts.poppins().fontFamily,);

  final edgeInsets = EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0);

  //forgot password text style
  final forgotpasswordTextStyle =
      TextStyle(color: appColor.primaryDarkColor, fontWeight: FontWeight.w500,fontFamily: GoogleFonts.poppins().fontFamily,);

  //not register Style
  final notRegisterStyle =
      TextStyle(color: appColor.primaryColor, fontSize: appScreenUtil.fontSize(14),fontWeight: FontWeight.w400,fontFamily: GoogleFonts.poppins().fontFamily,);

  //not register Style
  final notSignupStyle =
      TextStyle(color: appColor.primaryColor, fontSize: appScreenUtil.fontSize(14),fontWeight: FontWeight.w700,fontFamily: GoogleFonts.poppins().fontFamily,);

  titleTextStyle(color, fontWeight, letterSpacing,double fontSize) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontSize: fontSize,fontFamily: GoogleFonts.roboto(fontWeight: FontWeight.bold).fontFamily,);
  }
}
