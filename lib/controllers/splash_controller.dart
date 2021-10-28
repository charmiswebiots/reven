import 'package:flutter/material.dart';
import 'package:reven/global/route/index.dart';
import 'package:reven/global/utility/index.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    await Future.delayed(Duration(seconds: 2));
    checkLogin();
    super.onInit();
  }

  void checkLogin() async {
   /* //#region set Language
    String languageCode = helper.getStorage(session.languageCode);
    String countryCode = helper.getStorage(session.countryCode);
    if (!helper.isNullOrBlank(languageCode) && !helper.isNullOrBlank(countryCode)) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
    } else {
      Get.updateLocale(Get.deviceLocale ?? Locale('en', 'US'));
    }
    //#endregion
*/
    //#region check login
    bool isInternet = await helper.isNetworkConnection();
    if (isInternet) {
      String authToken = helper.getStorage(session.authToken);
      var intro = helper.getStorage(session.intro).toString();
      print("authToken : $intro");
      if (intro == "true") {
        Get.toNamed(routeName.login);
      } else {
        Get.toNamed(routeName.intro);
      }
    } else {
      helper.goToNoInternetScreen();
    }
    //#endregion
  }
}
