import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reven/global/commonWidget/common/custom_textformfield.dart';
import 'package:reven/global/packages/config_package.dart';

class LoginController extends GetxController {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  TextEditingController txtPhoneno = TextEditingController();
  bool isemail = false;
  bool obscuredText = true;
  bool isPassword = false;
  bool isemailLength = false;
  bool isPasswordLength = false;
  bool autoValidate = false;
  String? email;
  String? password;
  String? displayName;
  bool? loading = false;
  String? errorMsg = "";
  TabController? tabController;
  bool isValidate = false;
  FocusNode emailFocus = FocusNode();
  FocusNode mobileFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  String emailValidator(String value) {
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) return '*Required';
    if (!regex.hasMatch(value))
      return '*Enter a valid email';
    else
      return '';
  }

  login() async {
    Get.toNamed(routeName.otpScreen);
  }

  toggle() {
    obscuredText = !obscuredText;
    update();
  }

  onChange(val){
    print(val.length);
    if (val.length == 10) {
      isValidate = true;
      update();
    } else {
      isValidate = false;
      update();
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

}
