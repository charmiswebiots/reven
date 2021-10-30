import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:reven/controllers/verification_password_controller.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/commonWidget/intro_content.dart';
import 'package:reven/screens/verify_by_email_rr_mobile_screen/verify_by_code_style.dart';
import 'package:reven/screens/verify_by_email_rr_mobile_screen/verify_by_code_commonFields.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:reven/global/packages/config_package.dart';

class VerifyByEmailOrMobilePassword extends StatelessWidget {
  var forgotPasswordCtrl = Get.put(VerifyByEmailOrMobileController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final resendButton = VerifyByEmailOrMobileFields()
        .resendCode(onTap: () {}, style: VerifyByCodeStyle().resendCodeStyle);


    final customButton = VerifyByEmailOrMobileFields().customButton(
        onTap: () => Get.toNamed(routeName.confirmPassword));

    final otpFiled = GetBuilder<VerifyByEmailOrMobileController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: PinCodeTextField(
          autofocus: false,
          controller: forgotPasswordCtrl.controller,
          pinBoxColor: Colors.white,
          onTextChanged: (String otp) {
            /*if (otp.length == 4) {
              value.verify(context, mobileNo);
            }*/
          },
          highlightPinBoxColor: Theme.of(context).primaryColor,
          //hideCharacter: true,
          onDone: (val) async {},
          highlight: true,
          pinBoxHeight: size.width * 0.14,
          pinBoxWidth: size.width * 0.14,
          highlightColor: Theme.of(context).primaryColor,
          defaultBorderColor: Colors.grey,
          hasTextBorderColor: Theme.of(context).primaryColor.withOpacity(0.5),
          pinBoxBorderWidth: 1.5,
          maxLength: 4,
          pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
          pinBoxRadius: 15,
          pinTextStyle: TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).primaryColor,
          ),
          pinTextAnimatedSwitcherTransition:
              ProvidedPinBoxTextAnimation.scalingTransition,
          pinTextAnimatedSwitcherDuration: Duration(milliseconds: 200),
        ),
      ),
    );

    return GetBuilder<VerifyByEmailOrMobileController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          leading: VerifyByEmailOrMobileFields().icon(
              Icons.arrow_back, appColor.primaryColor,
              ontap: () => Get.back()),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2/ 50),
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * 500,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20), topLeft: Radius.circular(20))),
            child: VerifyByEmailOrMobileFields()
                .body(context, otpFiled, resendButton, customButton),
          ),
        ),
      ),
    );
  }
}
