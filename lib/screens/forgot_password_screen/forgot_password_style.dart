import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reven/global/packages/config_package.dart';

class ForgotPasswordStyle {
  //forgot password text style
  final forgotpasswordTextStyle =
      TextStyle(color: Color(0xFF265DCD), fontWeight: FontWeight.w500);

  //try another way text style
  final tryAnoterWayStyle = TextStyle(
      color: appColor.primaryDarkColor,
      fontSize: appScreenUtil.fontSize(18),
      decoration: TextDecoration.underline);

  //send button text style
  final sendButtonStyle =
      TextStyle(color: Colors.white, fontSize: appScreenUtil.fontSize(14),
        fontFamily: GoogleFonts.poppins().fontFamily,);

  //app bar text style
  final appBarTitleStyle = TextStyle(
    color: appColor.primaryColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
  );

  //not register Style
  description(color, fontWeight, letterSpacing, double fontSize) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily,
    );
  }

//title text style
  titleTextStyle(color, fontWeight, letterSpacing, fontSize) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      fontSize: appScreenUtil.fontSize(fontSize),
      fontFamily: GoogleFonts.roboto(fontWeight: FontWeight.bold).fontFamily,
    );
  }

  //try another way textstyle
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
