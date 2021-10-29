import 'package:flutter/material.dart';
import 'package:reven/controllers/splash_controller.dart';
import 'package:reven/global/packages/config_package.dart';
import 'package:reven/global/utility/index.dart';

class SplashScreen extends StatelessWidget {
  //this will call Splash Controller
  var splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.bgColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageAssets.logo,
                    height: appScreenUtil.size(150),
                    width: appScreenUtil.screenWidth(180),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),

                ],
              ),
            ),
            SizedBox(
              child: CircularProgressIndicator(),
              height: 20,
              width: 20,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
