import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reven/controllers/signup_controller.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/assets/index.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/commonWidget/common/custom_textformfield.dart';
import 'package:reven/global/theme/index.dart';
import 'package:reven/global/utility/index.dart';
import 'package:reven/screens/sign_up_screen/signup_commonFields.dart';
import 'package:reven/screens/sign_up_screen/signup_style.dart';
import 'package:reven/screens/sign_up_screen/signup_validation.dart';

class Signup extends StatelessWidget {
  var signupformKey = GlobalKey<FormState>();
  var signupCtrl = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    _fieldFocusChange(
        BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

    //name textformfield
    final nameFormField = CustomTextFormField(
      controller: signupCtrl.txtName,
      focusNode: signupCtrl.nameFocus,
      onFieldSubmitted: (value) {
        _fieldFocusChange(
            context, signupCtrl.emailFocus, signupCtrl.phoneFocus);
      },
      hintText: Font().nameHint,
      labelText: Font().nameLable,
      keyboardType: TextInputType.text,
      validator: (value) => SignupValidation().checkNameValidation(value),
    );

    //phone textformfield
    final phoneFormField = CustomTextFormField(
      controller: signupCtrl.txtPhone,
      hintText: Font().mobileHint,
      focusNode: signupCtrl.phoneFocus,
      labelText: Font().mobileLabel,
      onFieldSubmitted: (value) {
        _fieldFocusChange(
            context, signupCtrl.phoneFocus, signupCtrl.emailFocus);
      },
      keyboardType: TextInputType.phone,
      maxLength: 10,
      validator: (value) => SignupValidation().checkPhoneValidation(value),
    );

    //email textformfield
    final emailFormField = CustomTextFormField(
      controller: signupCtrl.txtEmail,
      hintText: Font().emailHint,
      labelText: Font().emaillabel,
      focusNode: signupCtrl.emailFocus,
      onFieldSubmitted: (value) {
        _fieldFocusChange(
            context, signupCtrl.emailFocus, signupCtrl.passwordFocus);
      },
      keyboardType: TextInputType.emailAddress,
      validator: (e) => SignupValidation().checkEmailValidation(e),
    );

    //password textformfield
    final passwordFormField = GetBuilder<SignupController>(
      builder: (controller) => CustomTextFormField(
        hintText: Font().passwordHint,
        labelText: Font().passwordLable,
        controller: signupCtrl.txtPassword,
        keyboardType: TextInputType.visiblePassword,
        focusNode: signupCtrl.passwordFocus,
        onFieldSubmitted: (value) {
          _fieldFocusChange(context, signupCtrl.passwordFocus,
              signupCtrl.confirmpasswordFocus);
        },
        obscureText: signupCtrl.obscuredText,
        validator: (value) => SignupValidation().checkPasswordValidation(value),
        suffixIcon: InkWell(
          onTap: () => signupCtrl.toggle(),
          child: signupCtrl.obscuredText
              ? Icon(Icons.visibility_off, color: Colors.black54)
              : Icon(Icons.visibility, color: Colors.black54),
        ),
      ),
    );

    //confirmpassword textformfield
    final confirmPasswordFormField = GetBuilder<SignupController>(
      builder: (controller) => CustomTextFormField(
        hintText: 'Min 8 characters',
        labelText: Font().confirmPasswordLable,
        controller: signupCtrl.txtConfirmPassword,
        obscureText: signupCtrl.confirmOscuredText,
        suffixIcon: InkWell(
          onTap: () => signupCtrl.confirmPasswordToggle(),
          child: signupCtrl.confirmOscuredText
              ? Icon(Icons.visibility_off, color: Colors.black54)
              : Icon(Icons.visibility, color: Colors.black54),
        ),
        validator: (value) => SignupValidation()
            .checkConfirmPasswordValidation(value, signupCtrl.txtPassword.text),
      ),
    );

    //signupbutton
    final signupButton = CustomButton(
      title: Font().signUp,
      height: appScreenUtil.size(45),
      color: appColor.primaryColor,
      style: SignupCodeStyle().btnTextstyle,
      onTap: () {
        if (signupformKey.currentState!.validate()) signupCtrl.signup();
      },
    );

    final googleLoginLayout =
        SignupFields().socialLayout(iconAssets.googlelogo);

    final facebookLoginLayout =
        SignupFields().socialLayout(iconAssets.facebooklogo);

    final appleLoginLayout = SignupFields().socialLayout(iconAssets.applelogo);

    return GetBuilder<SignupController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
              onTap: () => Get.back(),
              child:
                  SignupFields().icon(Icons.arrow_back, appColor.primaryColor)),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Form(
                  key: signupformKey,
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
                    child: SignupFields().body(
                        context,
                        nameFormField,
                        phoneFormField,
                        emailFormField,
                        passwordFormField,
                        confirmPasswordFormField,
                        googleLoginLayout,
                        facebookLoginLayout,
                        appleLoginLayout,
                        signupButton),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
