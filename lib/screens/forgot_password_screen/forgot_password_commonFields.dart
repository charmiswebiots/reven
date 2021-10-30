import 'package:flutter/material.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/packages/config_package.dart';
import 'package:reven/screens/forgot_password_screen/forgot_password_style.dart';
import 'package:reven/screens/intro_screen/intro_style.dart';
import 'package:reven/screens/login_screen/login_style.dart';

class ForgotPasswordFields {
  //get title
  getTextTitle(Color? color,
      {double? letterSpacing, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      Font().forgotPasswordTitle,
      style: ForgotPasswordStyle()
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

  //send button
  final customButton = ({Function? onTap}) => Container(

        child: CustomButton(
          onTap: onTap,
          title: 'Send',
          height: appScreenUtil.size(45),
          style: ForgotPasswordStyle().sendButtonStyle,
        ),
      );

  //get title
  final title = Text(
    Font().forgotPassWordAppBarTitle,
    style: ForgotPasswordStyle()
        .titleTextStyle(appColor.primaryColor, FontWeight.w900, 0.8, 30),
  );

  //get descriptionText
  final descriptionText = Text(
    Font().forgotPasswordDescription,
    style: ForgotPasswordStyle()
        .description(appColor.primaryColor, FontWeight.w400, 0.8, 14),
  );

  final body =
      (BuildContext context, textbox, customButton) =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ForgotPasswordFields().title,
              ForgotPasswordFields().heightSpacing(10),
              ForgotPasswordFields().descriptionText,
              ForgotPasswordFields().heightSpacing(30),
              textbox,
              ForgotPasswordFields().heightSpacing(30),
              customButton,
              ForgotPasswordFields().heightSpacing(50),
            ],
          );
}
