import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:reven/controllers/otp_controller.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/packages/config_package.dart';
import 'package:reven/screens/otp_screen/otp_commonFields.dart';
import 'package:reven/screens/otp_screen/otp_style.dart';

class OtpScreen extends StatelessWidget {
  var otpCtrl = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //resend button
    final resendButton = OtpFields()
        .resendCode(onTap: () {}, style: OtpCodeStyle().resendCodeStyle);

    //custom button
    final customButton = OtpFields()
        .customButton(onTap: () => Get.toNamed(routeName.confirmPassword));

    //otp filed
    final otpFiled = GetBuilder<OtpController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: PinCodeTextField(
          autofocus: false,
          controller: otpCtrl.otpController,
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

    return GetBuilder<OtpController>(
      builder: (_) =>  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          leading: OtpFields().icon(
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
            child: OtpFields()
                .body(context, otpFiled, resendButton, customButton),
          ),
        ),
      ),
    );
  }
}
