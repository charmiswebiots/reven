import 'package:flutter/material.dart';
import 'package:reven/global/theme/index.dart';
import 'package:reven/screens/login_screen/login_style.dart';

class LoginFields {

  getTextTitle(String? title, Color? color,
      {double? letterSpacing, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      title!,
      style: LoginStyle().titleTextStyle(color,fontWeight,letterSpacing,fontSize),
    );
  }

  final heightSpacing = (double data) => SizedBox(
        height: data,
      );

  final icon = (icon,Color color) => Icon(
    icon,color: color,
  );

  final body = (BuildContext context, _formKey, loginTab, tabBarView,
          forgotPassword, loginButton, notRegister) =>
      Container(
        margin: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height * 500,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginFields().getTextTitle(
                  'Welcome Back', appColor.textPrimaryColor,
                  letterSpacing: 0.5, fontSize: 20),
              LoginFields().heightSpacing(5),
              /* Text(
                        'Hello there, sign in to continue!',
                        style: TextStyle(
                            letterSpacing: 0.6,
                            color: appColor.textSecondaryColor,
                            fontWeight: FontWeight.w500),
                      ),*/
              LoginFields().getTextTitle('Hello there, sign in to continue!',
                  appColor.textSecondaryColor,
                  letterSpacing: 0.6, fontWeight: FontWeight.w500),
              LoginFields().heightSpacing(30),
              loginTab,
              // tab bar view here
              tabBarView,
              forgotPassword,
              LoginFields().heightSpacing(22),
              loginButton,
              LoginFields().heightSpacing(30),
              notRegister,
            ],
          ),
        ),
      );
}
