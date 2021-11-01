import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reven/global/packages/config_package.dart';

class OtpCodeStyle {
  //resend code text style
  final resendCodeStyle = TextStyle(
      color: appColor.primaryDarkColor,
      fontSize: appScreenUtil.fontSize(16),fontFamily: GoogleFonts.poppins().fontFamily,);

  //send button style
  final sendButtonStyle =
      TextStyle(color: Colors.white, fontSize: appScreenUtil.fontSize(14),fontFamily: GoogleFonts.poppins().fontFamily,);

  //app bar text style
  final appBarTitleStyle = TextStyle(
    color: appColor.primaryColor,
  );

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

//title text style
  descriptionTextStyle(color, fontWeight, letterSpacing, fontSize) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      fontSize: appScreenUtil.fontSize(fontSize),
      fontFamily: GoogleFonts.roboto().fontFamily,
    );
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
