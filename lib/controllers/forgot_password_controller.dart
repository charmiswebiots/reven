import 'package:flutter/material.dart';
import 'package:reven/global/packages/config_package.dart';

class ForgotPasswordController extends GetxController {
  double width = 0.0;
  double height = 0.0;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhoneno = TextEditingController();
  bool isValidate = false;

  //animate
  double animateheight = 100;
  double? one;
  double? two;
  double? oneFixed;
  double? twoFixed;
  Duration duration = Duration(milliseconds: 5);
  bool top = false, bottom = false;

  double getProportionateScreenHeight(inputHeight, context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // 812 is the layout height that designer use
    height = (inputHeight / 812.0) * screenHeight;
    return height;
  }

  String emailValidator(String value) {
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) return '*Required';
    if (!regex.hasMatch(value))
      return '*Enter a valid email';
    else
      return '';
  }

  @override
  void onReady() {

    // TODO: implement onReady
    one = -animateheight;
    two = -animateheight;
    oneFixed = -animateheight;
    twoFixed = animateheight;
    super.onReady();
  }
}
