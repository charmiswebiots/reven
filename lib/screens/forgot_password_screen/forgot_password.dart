import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reven/controllers/forgot_password_controller.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/commonWidget/common/custom_textformfield.dart';

import 'package:reven/global/packages/config_package.dart';
import 'package:reven/screens/forgot_password_screen/forgot_password_commonFields.dart';
import 'package:reven/screens/forgot_password_screen/forgot_password_validation.dart';

class ForgotPassword extends StatelessWidget {
  var forgotPasswordCtrl = Get.put(ForgotPasswordController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    //email textformfield
    final emailTextBox = GetBuilder<ForgotPasswordController>(builder: (controller) => CustomTextFormField(
      padding: 10,
      borderRadis: 60,
      controller: forgotPasswordCtrl.txtEmail,
      labelText: Font().emailorPhonelabel,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => ForgotPasswordValidation().checkForEmailOrPhone(value),
      suffixIcon: Icon(Icons.person, color: Colors.black54),
    ));

    //verify button
    final customButton = ForgotPasswordFields().customButton(
        onTap: () {
          if(_formKey.currentState!.validate())
            Get.toNamed(routeName.verifyByEmailOrMobile);
        });

    return GetBuilder<ForgotPasswordController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: ForgotPasswordFields().icon(
              Icons.arrow_back, appColor.primaryColor,
              ontap: () => Get.back()),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2/ 50),
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 500,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20), topLeft: Radius.circular(20))),
              child: ForgotPasswordFields().body(context,
                  emailTextBox, customButton),
            ),
          ),
        ),
      ),
    );
  }
}
