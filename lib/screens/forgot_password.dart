import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reven/controllers/forgot_password_controller.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/commonWidget/common/custom_textformfield.dart';
import 'package:reven/global/commonWidget/intro_content.dart';

import 'package:reven/global/packages/config_package.dart';

class ForgotPassword extends StatelessWidget {
  static double _height = 100, _one = -_height, _two = _height;
  final double _oneFixed = -_height;
  final double _twoFixed = _height;
  Duration _duration = Duration(milliseconds: 5);
  bool _top = false, _bottom = false;
  TabController? _tabController;
  var forgotPasswordCtrl = Get.put(ForgotPasswordController());

  void _toggleTop() {
    _top = !_top;
    Timer.periodic(_duration, (timer) {
      if (_top)
        _one += 2;
      else
        _one -= 2;

      if (_one >= 0) {
        _one = 0;
        timer.cancel();
      }
      if (_one <= _oneFixed) {
        _one = _oneFixed;
        timer.cancel();
      }
      forgotPasswordCtrl.update();
    });
  }

  void _toggleBottom() {
    _bottom = !_bottom;
    Timer.periodic(_duration, (timer) {
      if (_bottom)
        _two -= 2;
      else
        _two += 2;

      if (_two <= 0) {
        _two = 0;
        timer.cancel();
      }
      if (_two >= _twoFixed) {
        _two = _twoFixed;
        timer.cancel();
      }
      forgotPasswordCtrl.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Forgot Password',
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
                            'assets/images/forgot_password.png',
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
                  'Please enter your email Address To \nRecieve a Verification Code',
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
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    height: 80,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 0,
                          right: 0,
                          height: _height,
                          child: GestureDetector(
                            child: CustomTextFormField(
                              padding: 20,
                              borderRadis: 60,
                              controller: forgotPasswordCtrl.txtEmail,
                              hintText: 'Ex : abc@gmail.com',
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                forgotPasswordCtrl.emailValidator(value!);
                                forgotPasswordCtrl.update();
                              },
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.black54),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: _one,
                          height: _height,
                          child: CustomTextFormField(
                            padding: 20,
                            borderRadis: 60,
                            controller: forgotPasswordCtrl.txtPhoneno,
                            hintText: 'Ex : 9316140133',
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            validator: (value) {
                              if (value!.isEmpty)
                                return "Phoneno is Required";
                              else
                                return null;
                            },
                            onChanged: (val) {
                              print(val.length);
                              if (val.length == 10) {
                                forgotPasswordCtrl.isValidate = true;
                                forgotPasswordCtrl.update();
                              } else {
                                forgotPasswordCtrl.isValidate = false;
                                forgotPasswordCtrl.update();
                              }
                            },
                            suffixIcon: forgotPasswordCtrl.isValidate
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _toggleTop();
                  },
                  child: Text(
                    'Try Another Way',
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
                      onTap: () {
                        Get.toNamed(routeName.verifyByEmailOrMobile);
                      },
                      title: 'Send',
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
