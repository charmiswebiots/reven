import 'package:reven/global/packages/screen_package.dart';
import 'package:reven/screens/confirm_password_screen/confirm_password.dart';
import 'package:reven/screens/forgot_password_screen/forgot_password.dart';
import 'package:reven/screens/home.dart';
import 'package:get/get.dart';
import 'package:reven/screens/intro_screen/intro.dart';
import 'package:reven/screens/login_screen/login.dart';
import 'package:reven/screens/no_internet.dart';
import 'package:reven/screens/otp_screen/otp_screen.dart';
import 'package:reven/screens/sign_up_screen/signup.dart';
import 'package:reven/screens/verify_by_email_rr_mobile_screen/verify_By_Email_Or_Mobile.dart';

//app file
import 'route_name.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.home, page: () => HomeScreen()),
    GetPage(name: _routeName.noInternet, page: () => NoInternet()),
    GetPage(name: _routeName.login, page: () => Login()),
    GetPage(name: _routeName.intro, page: () => Intro()),
    GetPage(name: _routeName.signup, page: () => Signup()),
    GetPage(name: _routeName.forgotPassword, page: () => ForgotPassword()),
    GetPage(
        name: _routeName.verifyByEmailOrMobile,
        page: () => VerifyByEmailOrMobilePassword()),
    GetPage(name: _routeName.otpScreen, page: () => OtpScreen()),
    GetPage(name: _routeName.confirmPassword, page: () => ConfirmPassword()),
  ];
}
