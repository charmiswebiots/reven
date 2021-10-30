import 'package:flutter/material.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/packages/config_package.dart';
import 'package:reven/screens/forgot_password_screen/forgot_password_style.dart';
import 'package:reven/screens/intro_screen/intro_style.dart';
import 'package:reven/screens/login_screen/login_style.dart';
import 'package:reven/screens/otp_screen/otp_style.dart';

class OtpFields {
  //get title
  getTextTitle(Color? color,
      {double? letterSpacing, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      Font().otpTitle,
      style: OtpCodeStyle()
          .titleTextStyle(color, fontWeight, letterSpacing, fontSize),
    );
  }

  //get verification title
  getVerificationTitle(Color? color,
      {double? letterSpacing, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      Font().verification,
      style: OtpCodeStyle()
          .titleTextStyle(color, fontWeight, letterSpacing, fontSize),
    );
  }

  //sizedbox height
  final heightSpacing = (double data) => SizedBox(
        height: appScreenUtil.size(data),
      );

  //get text value
  final text = (data, style, {TextAlign? textAlign}) => Text(
        data,
        style: style,
        textAlign: textAlign,
      );

  //get icon
  final icon = (icon, Color color, {GestureTapCallback? ontap}) => InkWell(
        onTap: ontap,
        child: Icon(
          icon,
          color: color,
        ),
      );

  //first clipoval
  final firstClipOval = (context) => ClipOval(
        child: Container(
          width: MediaQuery.of(context).size.width * appScreenUtil.size(0.6),
          height: MediaQuery.of(context).size.width * appScreenUtil.size(0.6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey.withOpacity(0.2),
                Colors.grey.withOpacity(0.2),
              ],
            ),
          ),
        ),
      );

  //second clipoval
  final secondCilpOval = (context) => ClipOval(
        child: Container(
          width: MediaQuery.of(context).size.width *
              (appScreenUtil.size(0.6) - appScreenUtil.size(0.2)),
          height: MediaQuery.of(context).size.width *
              (appScreenUtil.size(0.6) - appScreenUtil.size(0.2)),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey.withOpacity(0.4),
                Colors.grey.withOpacity(0.4),
              ],
            ),
          ),
        ),
      );

  //image widget
  final imageWidget = (context) => Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              OtpFields().firstClipOval(context),
              OtpFields().secondCilpOval(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imageAssets.otp,
                  height: appScreenUtil.size(200),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      );

  //verify button
  final customButton = ({Function? onTap}) => Container(

        child: CustomButton(
          onTap: onTap,
          title: Font().verify,
          height: appScreenUtil.size(45),
          style: OtpCodeStyle().sendButtonStyle,
        ),
      );

  //resend code
  final resendCode = ({GestureTapCallback? onTap, style}) => InkWell(
        onTap: onTap,
        child: OtpFields().text(Font().resendCode, style),
      );

  //otp title
  final title = Text(
    Font().otpAppBarTitle,
    style: OtpCodeStyle()
        .titleTextStyle(appColor.primaryColor, FontWeight.w900, 0.5, 30),
  );

  //get descriptionText
  final descriptionText = Text(
    Font().otpTitle,
    style: OtpCodeStyle()
        .descriptionTextStyle(appColor.primaryColor, FontWeight.w400, 0.8, 14),
  );

  final body =
      (BuildContext context, otpFiled, resendButton, customButton) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OtpFields().title,
              OtpFields().heightSpacing(10),
              OtpFields().descriptionText,
              OtpFields().heightSpacing(20),
              otpFiled,
              OtpFields().heightSpacing(20),
              resendButton,
              OtpFields().heightSpacing(30),
              customButton,
              OtpFields().heightSpacing(50),
            ],
          );
}
