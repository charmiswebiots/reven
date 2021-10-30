import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/route/index.dart';
import 'package:reven/global/theme/index.dart';
import 'package:reven/global/utility/index.dart';
import 'package:reven/screens/login_screen/login_style.dart';

class LoginFields {
  getTextTitle(String? title, Color? color,
      {double? letterSpacing, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      title!,
      style: LoginStyle()
          .titleTextStyle(color, fontWeight, letterSpacing, fontSize!),
    );
  }

  final heightSpacing = (double data) => SizedBox(
        height: appScreenUtil.size(data),
      );

  final icon = (icon, Color color) => Icon(
        icon,
        color: color,
      );

  //get login text
  final getLoginText = Text(
    Font().logIn,
    style: LoginStyle()
        .titleTextStyle(appColor.primaryColor, FontWeight.w900, 0.8, 30),
  );

  //get signup text
  final getsignup = Text(
    Font().signUp,
    style: LoginStyle().notSignupStyle,
  );

  final socialLayout = (icon) => Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(color: appColor.inputBorder),
            borderRadius: BorderRadius.circular(12)),
        child: Image.asset(
          icon,
          height: 30,
          width: 30,
        ),
      );

  //not register
  final notRegister = Container(
    margin: EdgeInsets.only(bottom: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Font().notRegisterYet,
          style: LoginStyle().notRegisterStyle,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(routeName.signup);
          },
          child: Text(
            Font().signUp,
            style: LoginStyle().notSignupStyle,
          ),
        ),
      ],
    ),
  );

  final body = (
    BuildContext context,
    _formKey,
    getemailTextField,
    getPasswordFIeld,
    forgotPassword,
    loginButton,
    googleLoginLayout,
    facebookLoginLayout,
    appleLoginLayout,
  ) =>
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2/ 50),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height * 500,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginFields().getLoginText,
                  LoginFields().heightSpacing(30),
                  getemailTextField,
                  LoginFields().heightSpacing(20),
                  getPasswordFIeld,
                  LoginFields().heightSpacing(20),
                  forgotPassword,
                  LoginFields().heightSpacing(22),
                  loginButton,
                  LoginFields().heightSpacing(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      googleLoginLayout,
                      facebookLoginLayout,
                      appleLoginLayout,
                    ],
                  ),
                  LoginFields().heightSpacing(30),
                  LoginFields().notRegister,
                  LoginFields().heightSpacing(30),
                ],
              ),
            ],
          ),
        ),
      );
}
