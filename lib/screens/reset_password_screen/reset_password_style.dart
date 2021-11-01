import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reven/global/packages/config_package.dart';

class ResetPasswordStyle {

  //send button text style
  final sendButtonStyle =TextStyle(
      color: Colors.white, fontSize: appScreenUtil.fontSize(14),
    fontFamily: GoogleFonts.poppins().fontFamily,);

  //app bar text style
  final appBarTitleStyle = TextStyle(
    color: appColor.primaryColor,
  );

  //get title
  titleTextStyle(color, fontWeight, letterSpacing, fontSize) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontSize: appScreenUtil.fontSize(fontSize),
      fontFamily: GoogleFonts.roboto(fontWeight: FontWeight.bold).fontFamily,);
  }

  //get title
  descriptionTextStyle(color, fontWeight, letterSpacing, fontSize) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontSize: appScreenUtil.fontSize(fontSize),
      fontFamily: GoogleFonts.roboto().fontFamily,);
  }
}
