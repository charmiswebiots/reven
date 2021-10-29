import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reven/global/packages/config_package.dart';

class IntroStyle {
  // Back Title 1
  final backText =
      TextStyle(letterSpacing: 2, fontSize: appScreenUtil.fontSize(16));

// Next Title 2
  final nextText =
      TextStyle(letterSpacing: 2, fontSize: appScreenUtil.fontSize(16));

// Heading Text
  final headText = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w800, color: appColor.primaryColor);

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
      TextStyle(color: Colors.white, letterSpacing: 0.5, fontSize: 16);

  final edgeInsets = EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0);

  //forgot password text style
  final forgotpasswordTextStyle =
      TextStyle(color: Color(0xFF265DCD), fontWeight: FontWeight.w500);

  //not register Style
  final notRegisterStyle = TextStyle(
      color: appColor.primaryDarkColor, fontSize: appScreenUtil.fontSize(18));

//get title text
  titleTextStyle(color, fontWeight, letterSpacing, fontSize) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontSize: appScreenUtil.fontSize(fontSize));
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
