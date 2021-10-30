import 'package:flutter/material.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/packages/config_package.dart';
import 'package:reven/screens/forgot_password_screen/forgot_password_style.dart';
import 'package:reven/screens/intro_screen/intro_style.dart';
import 'package:reven/screens/login_screen/login_style.dart';
import 'package:reven/screens/otp_screen/otp_style.dart';
import 'package:reven/screens/sign_up_screen/signup_style.dart';

class SignupFields {
  //get title
  getTextTitle(Color? color,
      {double? letterSpacing, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      Font().otpTitle,
      style: OtpCodeStyle()
          .titleTextStyle(color, fontWeight, letterSpacing, fontSize),
    );
  }

  //sizedbox height
  final heightSpacing = (double data) => SizedBox(
        height: appScreenUtil.size(data),
      );

  final text = (data, {style, TextAlign? textAlign}) => Text(
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

  final imageLogoDisplay = Image.asset(
    imageAssets.logo,
    height: appScreenUtil.size(100),
    fit: BoxFit.fill,
  );

  final socialLayout = (icon) => Container(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(color: appColor.inputBorder),
            borderRadius: BorderRadius.circular(12)),
        child: Image.asset(
          icon,
          height: 30,
          width: 30,
        ),
      );

  //get createaccount text
  final getcreateaccountText = Text(
    Font().createAccount,
    style: SignupCodeStyle().titleTextStyle(appColor.primaryColor,
        FontWeight.w900, 0.9, appScreenUtil.fontSize(30)),
  );

  //alreadyAccount
  final alreadyAccount = Container(
    margin: EdgeInsets.only(bottom: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Font().alreadyHaveAccont,
          style: SignupCodeStyle().alreadyAccountStyle,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(routeName.signup);
          },
          child: Text(
            Font().signIn,
            style: SignupCodeStyle().signInStyle,
          ),
        ),
      ],
    ),
  );

  final body = (BuildContext context,
          namTextFormFiled,
          phoneTextFormField,
          emailTextFormField,
          passwordTextFormField,
          confirmPasswordTextFormField,
          googleLoginLayout,
          facebookLoginLayout,
          appleLoginLayout,
          signUpButton) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SignupFields().getcreateaccountText,
          SignupFields().heightSpacing(30),
          namTextFormFiled,
          SignupFields().heightSpacing(20),
          phoneTextFormField,
          SignupFields().heightSpacing(20),
          emailTextFormField,
          SignupFields().heightSpacing(20),
          passwordTextFormField,
          SignupFields().heightSpacing(20),
          confirmPasswordTextFormField,
          SignupFields().heightSpacing(22),
          signUpButton,
          SignupFields().heightSpacing(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              googleLoginLayout,
              facebookLoginLayout,
              appleLoginLayout,
            ],
          ),
          SignupFields().heightSpacing(30),
          SignupFields().alreadyAccount,
          SignupFields().heightSpacing(30),
        ],
      );
}
