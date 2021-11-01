import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reven/controllers/login_controller.dart';
import 'package:reven/fontTitle.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/commonWidget/common/custom_textformfield.dart';
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

    //email textformfield
    final getemailTextField = GetBuilder<LoginController>(
      builder: (controller) => CustomTextFormField(
        focusNode: loginCtrl.emailFocus,
        padding: 10,
        borderRadis: 60,
        controller: loginCtrl.txtemail,
        onFieldSubmitted: (value) {
          _fieldFocusChange(
              context, loginCtrl.emailFocus, loginCtrl.passwordFocus);
        },
        //hintText: Font().emailHint,
        labelText: Font().emailorPhonelabel,
        validator: (value) => LoginValidation().checkForEmailOrPhone(value),
        suffixIcon: LoginFields().icon(Icons.person, Colors.black54),
      ),
    );

    //password textformfield
    final getPasswordFIeld = GetBuilder<LoginController>(
      builder: (controller) => CustomTextFormField(
        padding: 10,
        borderRadis: 60,
        controller: loginCtrl.txtpassword,
        keyboardType: TextInputType.visiblePassword,
        hintText: Font().passwordHint,
        obscureText: loginCtrl.obscuredText,
        labelText: Font().passwordLable,
        suffixIcon: InkWell(
            onTap: () => loginCtrl.toggle(),
            child: loginCtrl.obscuredText
                ? LoginFields().icon(Icons.visibility_off, Colors.black54)
                : LoginFields().icon(Icons.visibility, Colors.black54)),
        validator: (value) => LoginValidation().checkPasswordValidation(value),
      ),
    );

    final googleLoginLayout = LoginFields().socialLayout(iconAssets.googlelogo);

    final facebookLoginLayout =
        LoginFields().socialLayout(iconAssets.facebooklogo);

    final appleLoginLayout = LoginFields().socialLayout(iconAssets.applelogo);

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
      height: appScreenUtil.size(45),
      color: appColor.primaryColor,
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

    return GetBuilder<LoginController>(
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: LoginFields().body(
                context,
                _formKey,
                getemailTextField,
                getPasswordFIeld,
                forgotPassword,
                loginButton,
                googleLoginLayout,
                facebookLoginLayout,
                appleLoginLayout,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
