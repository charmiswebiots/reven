import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reven/controllers/login_controller.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/commonWidget/common/custom_textformfield.dart';
import 'package:reven/global/commonWidget/loginTab.dart';
import 'package:reven/global/commonWidget/tab1.dart';
import 'package:reven/global/commonWidget/tab2.dart';
import 'package:reven/global/packages/config_package.dart';
import 'package:reven/global/theme/index.dart';
import 'package:reven/screens/login_screen/login_commonFields.dart';
import 'package:reven/screens/login_screen/login_style.dart';
import 'package:reven/screens/login_screen/login_validation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  var loginCtrl = Get.put(LoginController());
  TabController? _tabController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fieldFocusChange(
        BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

    //tab option
    final loginTab = LoginTab(
      tabController: _tabController,
    );

    //email textformfield
    final getemailTextField = CustomTextFormField(
      focusNode: loginCtrl.emailFocus,
      padding: 20,
      borderRadis: 60,
      controller: loginCtrl.txtemail,
      onFieldSubmitted: (value) {
        _fieldFocusChange(context, loginCtrl.emailFocus, loginCtrl.passwordFocus);
      },
      hintText: Font().emailHint,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => LoginValidation().checkEmailIDValidation(value),
      prefixIcon: LoginFields().icon(Icons.email, Colors.black54),
    );

    //password textformfield
    final getPasswordFIeld = GetBuilder<LoginController>(
      builder: (controller) => CustomTextFormField(
        padding: 20,
        borderRadis: 60,
        controller: loginCtrl.txtpassword,
        keyboardType: TextInputType.visiblePassword,
        hintText: Font().passwordHint,
        obscureText: loginCtrl.obscuredText,
        prefixIcon: LoginFields().icon(Icons.vpn_key, Colors.black54),
        suffixIcon: InkWell(
            onTap: () => loginCtrl.toggle(),
            child: loginCtrl.obscuredText
                ? LoginFields().icon(Icons.visibility_off, Colors.black54)
                : LoginFields().icon(Icons.visibility, Colors.black54)),
        validator: (value) => LoginValidation().checkPasswordValidation(value),
      ),
    );

    //mobile textformfield
    final getPhoneField = GetBuilder<LoginController>(
      builder: (controller) => CustomTextFormField(
        padding: 20,
        borderRadis: 60,
        controller: loginCtrl.txtPhoneno,
        hintText: Font().mobileHint,
        keyboardType: TextInputType.phone,
        focusNode:  loginCtrl.mobileFocus,
        onFieldSubmitted: (value) {
          _fieldFocusChange(context, loginCtrl.mobileFocus, loginCtrl.passwordFocus);
        },
        maxLength: 10,
        validator: (value) => LoginValidation().checkPhoneValidation(value),
        onChanged: (value) => loginCtrl.onChange(value),
        suffixIcon: loginCtrl.isValidate
            ? LoginFields().icon(Icons.check_circle, Colors.green)
            : LoginFields().icon(Icons.cancel, Colors.red),
        prefixIcon: LoginFields().icon(Icons.phone_android, Colors.grey),
      ),
    );


    //tabbarview option
    final tabBarView = SizedBox(
      height: MediaQuery.of(context).size.height * appScreenUtil.size(35) / 100,
      child: TabBarView(
        controller: _tabController,
        children: [
          // first tab bar view widget
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginFields().heightSpacing(20),
                Text(Font().usernameoremail),
                LoginFields().heightSpacing(10),
                getemailTextField,
                LoginFields().heightSpacing(20),
                Text(Font().password),
                LoginFields().heightSpacing(10),
                getPasswordFIeld
              ],
            ),
          ),
          // second tab bar view widget
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginFields().heightSpacing(20),
                Text(Font().phone),
                LoginFields().heightSpacing(10),
                getPhoneField,
                LoginFields().heightSpacing(20),
                Text(Font().password),
                LoginFields().heightSpacing(10),
                getPasswordFIeld
              ],
            ),
          ),
        ],
      ),
    );

    //forgot password
    final forgotPassword = Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Get.toNamed(routeName.forgotPassword);
        },
        child: Container(
          child: Text(Font().forgotPassword,
              style: LoginStyle().forgotpasswordTextStyle),
        ),
      ),
    );


    //login button
    final loginButton = CustomButton(
      title: Font().signIn,
      height: 50,
      color: Color(0xFF88A6A8),
      radius: 50,
      style: LoginStyle().btnTextstyle,
      onTap: () {
        if (_formKey.currentState!.validate()) if (loginCtrl.txtemail.text !=
                "" &&
            loginCtrl.txtpassword.text != "") {
          loginCtrl.login();
        } else {
          helper.alertMessage('Please Enter Email and Password');
        }
      },
    );

    //not register
    final notRegister = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Font().notRegisterYet,
          style: appCss.h5,
        ),
        InkWell(
          onTap: (){
            Get.toNamed(routeName.signup);
          },
          child: Text(
            Font().signUp,
            style: LoginStyle().notRegisterStyle,
          ),
        ),
      ],
    );

    return GetBuilder<LoginController>(
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: LoginFields().body(context, _formKey, loginTab, tabBarView,
                  forgotPassword, loginButton, notRegister),
            ),
          ),
        ),
      ),
    );
  }
}
