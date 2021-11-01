import 'package:flutter/material.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/packages/config_package.dart';
import 'package:reven/screens/reset_password_screen/reset_password_style.dart';

class ResetPasswordFields {
  //get title
  getTextTitle(Color? color,
      {double? letterSpacing, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      Font().confirmPasswordTitle,
      style: ResetPasswordStyle()
          .titleTextStyle(color, fontWeight, letterSpacing, fontSize),
    );
  }

  //sizedbox height
  final heightSpacing = (double data) => SizedBox(
        height: appScreenUtil.size(data),
      );

  //get text
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


  //get image
  final imageWidget = (context) => Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ResetPasswordFields().firstClipOval(context),
              ResetPasswordFields().secondCilpOval(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imageAssets.confirmPassword,
                  height: appScreenUtil.size(200),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      );

  //button
  final customButton = ({Function? onTap}) => Container(

        child: CustomButton(
          onTap: onTap,
          title: Font().send,
          height: appScreenUtil.size(45),
          style: ResetPasswordStyle().sendButtonStyle,
        ),
      );

  //resend code
  final resendCode = ({GestureTapCallback? onTap, style}) => InkWell(
        onTap: onTap,
        child: ResetPasswordFields().text(Font().resendCode, style),
      );

  //get title
  final title = Text(
    Font().confirmPasswordAppBarTitle,
    style: ResetPasswordStyle().titleTextStyle(appColor.primaryColor, FontWeight.w900, 0.8, 30),
  );


  //get descriptionText
  final descriptionText = Text(
    Font().confirmPasswordTitle,
    style: ResetPasswordStyle()
        .descriptionTextStyle(appColor.primaryColor, FontWeight.w400, 0.8, 14),
  );

  final body = (BuildContext context, passwordTextBox, customButton,
          confirmpasswordTextBox) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResetPasswordFields().title,
          ResetPasswordFields().heightSpacing(10),
          ResetPasswordFields().descriptionText,
          ResetPasswordFields().heightSpacing(30),
          passwordTextBox,
          ResetPasswordFields().heightSpacing(20),
          confirmpasswordTextBox,
          ResetPasswordFields().heightSpacing(30),
          customButton,
          ResetPasswordFields().heightSpacing(50),
        ],
      );
}
