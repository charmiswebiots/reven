import 'package:flutter/material.dart';
import 'package:reven/global/packages/config_package.dart';

class SignupController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  bool isActive = false;

  FocusNode nameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmpasswordFocus = FocusNode();

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

  signup(){}
}
