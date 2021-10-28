import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:reven/controllers/verification_password_controller.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/commonWidget/intro_content.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:reven/global/packages/config_package.dart';

class VerifyByEmailOrMobilePassword extends StatelessWidget {
  var forgotPasswordCtrl = Get.put(VerifyByEmailOrMobileController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<VerifyByEmailOrMobileController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Verify By Code',
            style: TextStyle(
              color: appColor.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: appColor.primaryColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipOval(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.width * 0.6,
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
                        ),
                        ClipOval(
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * (0.6 - 0.2),
                            height:
                                MediaQuery.of(context).size.width * (0.6 - 0.2),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/email_verified.png',
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Please Enter The 4 Digit Code Sent To \ndhruvikapdi@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: appColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
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
                    hasTextBorderColor:
                        Theme.of(context).primaryColor.withOpacity(0.5),
                    pinBoxBorderWidth: 1.5,
                    maxLength: 4,
                    pinBoxDecoration:
                        ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                    pinBoxRadius: 15,
                    pinTextStyle: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                    pinTextAnimatedSwitcherDuration:
                        Duration(milliseconds: 200),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                      color: appColor.primaryDarkColor,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    margin: EdgeInsets.all(12),
                    child: CustomButton(
                      onTap: () {},
                      title: 'Verify',
                      height: 50,
                      radius: 60,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
