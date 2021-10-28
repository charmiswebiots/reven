import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:reven/controllers/otp_controller.dart';
import 'package:reven/global/packages/config_package.dart';

class OtpScreen extends StatelessWidget {
  var otpCtrl = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<OtpController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text("OTP",style: TextStyle(color: appColor.primaryColor),),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back,color: appColor.primaryColor),
          ),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.width * 0.15),
                      Image.asset('assets/images/otp.png',height: 250,),
                      SizedBox(height: size.width * 0.15),
                      Text(
                        "Verification",
                        style: appCss.h3,
                      ),
                      SizedBox(height: size.width * 0.05),
                      Text(
                        "Enter the Verification code we\njust send you on your Number",
                        style: appCss.h5,
                      ),
                      SizedBox(height: size.width * 0.10),
                      Container(
                        padding: EdgeInsets.only(bottom: 30),
                        child: PinCodeTextField(
                          autofocus: false,
                          controller: otpCtrl.otpController,
                          pinBoxColor: Colors.white,
                          onTextChanged: (String otp) {
                            /*if (otp.length == 4) {
                                    value.verify(context, mobileNo);
                                  }*/
                          },
                          highlightPinBoxColor:
                          Theme.of(context).primaryColor,
                          //hideCharacter: true,
                          onDone: (val) async{

                          },
                          highlight: true,
                          pinBoxHeight: size.width * 0.14,
                          pinBoxWidth: size.width * 0.14,
                          highlightColor: Theme.of(context).primaryColor,
                          defaultBorderColor: Colors.grey,
                          hasTextBorderColor: Theme.of(context)
                              .primaryColor
                              .withOpacity(0.5),
                          pinBoxBorderWidth: 1.5,
                          maxLength: 4,
                          pinBoxDecoration: ProvidedPinBoxDecoration
                              .underlinedPinBoxDecoration,
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
                      SizedBox(height: size.width * 0.01),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "If you did't receive a code!",

                            ),
                            TextSpan(
                                text: " Resend",
                                style: TextStyle(
                                  color: appColor.primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: size.width * 0.15),
                      GestureDetector(
                        onTap: () async{

                        },
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            height: 45,
                            width: 200,
                            decoration: BoxDecoration(
                              color: appColor.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Verify',style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
