import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:reven/controllers/confirmPassword_controller.dart';
import 'package:reven/controllers/verification_password_controller.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/commonWidget/common/custom_textformfield.dart';
import 'package:reven/global/commonWidget/intro_content.dart';
import 'package:reven/screens/confirm_password_screen/confirm_password_commonField.dart';
import 'package:reven/screens/confirm_password_screen/confirm_password_commonField.dart';
import 'package:reven/screens/confirm_password_screen/confirm_password_commonField.dart';
import 'package:reven/screens/confirm_password_screen/confirm_password_commonField.dart';
import 'package:reven/screens/confirm_password_screen/confirm_password_commonField.dart';
import 'package:reven/screens/confirm_password_screen/confirm_password_commonField.dart';
import 'package:reven/screens/confirm_password_screen/confirm_password_style.dart';
import 'package:reven/screens/confirm_password_screen/confirm_password_style.dart';
import 'package:reven/screens/confirm_password_screen/confirm_password_validation.dart';
import 'package:reven/screens/verify_by_email_rr_mobile_screen/verify_by_code_style.dart';
import 'package:reven/screens/verify_by_email_rr_mobile_screen/verify_by_code_commonFields.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:reven/global/packages/config_package.dart';

class ConfirmPassword extends StatelessWidget {
  var confirmPasswordCtrl = Get.put(ConfirmPasswordContoller());
  var confirmKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //password textformfield
    final passwordTextBox = GetBuilder<ConfirmPasswordContoller>(
      builder: (controller) => CustomTextFormField(
        focusNode: confirmPasswordCtrl.password,
        padding: 10,
        borderRadis: 60,
        labelText: Font().passwordLable,
        hintText: 'Min 8 characters',
        controller: confirmPasswordCtrl.txtPassword,
        keyboardType: TextInputType.visiblePassword,
        obscureText: confirmPasswordCtrl.obscuredText,
        validator: (value) =>
            ConfirmPasswordValidation().checkPasswordValidation(value),
        prefixIcon: ConfirmPasswordFields().icon(Icons.vpn_key, Colors.grey),
        suffixIcon: InkWell(
          onTap: () => confirmPasswordCtrl.toggle(),
          child: confirmPasswordCtrl.obscuredText
              ? ConfirmPasswordFields().icon(Icons.visibility_off, Colors.grey)
              : ConfirmPasswordFields().icon(Icons.visibility, Colors.grey),
        ),
      ),
    );

    //confirmpassword textformfield
    final confirmpasswordTextBox = GetBuilder<ConfirmPasswordContoller>(
      builder: (controller) => CustomTextFormField(
        focusNode: confirmPasswordCtrl.confirmpassword,
        padding: 10,
        borderRadis: 60,
        hintText: 'Min 8 characters',
        labelText: Font().confirmPasswordLable,
        controller: confirmPasswordCtrl.txtConfirmPassword,
        keyboardType: TextInputType.visiblePassword,
        obscureText: confirmPasswordCtrl.confirmOscuredText,
        validator: (value) => ConfirmPasswordValidation()
            .checkConfirmPasswordValidation(
                value, confirmPasswordCtrl.txtPassword.text),
        prefixIcon: ConfirmPasswordFields().icon(Icons.vpn_key, Colors.grey),
        suffixIcon: InkWell(
          onTap: () => confirmPasswordCtrl.confirmPasswordToggle(),
          child: confirmPasswordCtrl.confirmOscuredText
              ? ConfirmPasswordFields().icon(Icons.visibility_off, Colors.grey)
              : ConfirmPasswordFields().icon(Icons.visibility, Colors.grey),
        ),
      ),
    );

    //sendbutton
    final customButton = ConfirmPasswordFields().customButton(onTap: () {
      if (confirmKey.currentState!.validate()) Get.offAllNamed(routeName.login);
    });

    return GetBuilder<ConfirmPasswordContoller>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: ConfirmPasswordFields().icon(
              Icons.arrow_back, appColor.primaryColor,
              ontap: () => Get.back()),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: confirmKey,
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2 / 50),
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 500,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: ConfirmPasswordFields().body(context, passwordTextBox,
                  customButton, confirmpasswordTextBox),
            ),
          ),
        ),
      ),
    );
  }
}
