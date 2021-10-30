import 'package:flutter/material.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/packages/config_package.dart';
import 'package:reven/screens/forgot_password_screen/forgot_password_style.dart';
import 'package:reven/screens/intro_screen/intro_style.dart';
import 'package:reven/screens/login_screen/login_style.dart';
import 'package:reven/screens/verify_by_email_rr_mobile_screen/verify_by_code_style.dart';

class VerifyByEmailOrMobileFields {
  //get title
  getTextTitle(Color? color,
      {double? letterSpacing, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      Font().forgotPasswordTitle,
      style: VerifyByCodeStyle()
          .titleTextStyle(color, fontWeight, letterSpacing, fontSize),
    );
  }

  //sizedbox height
  final heightSpacing = (double data) => SizedBox(
        height: appScreenUtil.size(data),
      );

  final text = (data, style, {TextAlign? textAlign}) => Text(
        data,
        style: style,
        textAlign: textAlign,
      );

  final icon = (icon, Color color, {GestureTapCallback? ontap}) => InkWell(
        onTap: ontap,
        child: Icon(
          icon,
          color: color,
        ),
      );

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

  final customButton = ({Function? onTap}) => Container(

        child: CustomButton(
          onTap: onTap,
          title: Font().verify,
          height: appScreenUtil.size(45),
          style: ForgotPasswordStyle().sendButtonStyle,
        ),
      );

  final resendCode = ({GestureTapCallback? onTap, style}) => InkWell(
        onTap: onTap,
        child: VerifyByEmailOrMobileFields().text(Font().resendCode, style),
      );

  final title = Text(
    Font().verifyByCodeAppBarTitle,
    style: VerifyByCodeStyle()
        .titleTextStyle(appColor.primaryColor, FontWeight.w900, 0.5, 30),
  );

//get descriptionText
  final descriptionText = Text(
    Font().forgotPasswordDescription,
    style: VerifyByCodeStyle()
        .descriptionTextStyle(appColor.primaryColor, FontWeight.w400, 0.8, 14),
  );

  final body =
      (BuildContext context, otpFiled, resendButton, customButton) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerifyByEmailOrMobileFields().title,
              VerifyByEmailOrMobileFields().heightSpacing(10),
              VerifyByEmailOrMobileFields().descriptionText,
              VerifyByEmailOrMobileFields().heightSpacing(20),
              otpFiled,
              VerifyByEmailOrMobileFields().heightSpacing(20),
              resendButton,
              VerifyByEmailOrMobileFields().heightSpacing(30),
              customButton,
              VerifyByEmailOrMobileFields().heightSpacing(50),
            ],
          );
}
