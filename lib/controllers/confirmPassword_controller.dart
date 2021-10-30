import 'package:flutter/material.dart';
import 'package:reven/global/packages/config_package.dart';

class ConfirmPasswordContoller extends GetxController{

  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  FocusNode password = FocusNode();
  FocusNode confirmpassword = FocusNode();

  bool obscuredText = true;
  bool confirmOscuredText = true;

  toggle() {
    obscuredText = !obscuredText;
    update();
  }

  confirmPasswordToggle() {
    confirmOscuredText = !confirmOscuredText;
    update();
  }

}