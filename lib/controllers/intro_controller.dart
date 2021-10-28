import 'package:flutter/material.dart';
import 'package:reven/global/packages/config_package.dart';

class IntroController extends GetxController {
  int currentPage = 0;
  double width = 0.0;
  double height = 0.0;
  final PageController controller = PageController(initialPage: 0);
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to reven",
      'description': 'Let’s shop from multiple Shops & Brands',
      "image": "assets/images/splash_4.png"
    },
    {
      "text":
          "We help people connect with store \naround United State of America",
      'description': 'Let’s shop from multiple Shops & Brands',
      "image": "assets/images/splash_5.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      'description': 'Let’s shop from multiple Shops & Brands',
      "image": "assets/images/splash_3.png"
    },
  ];

  double getProportionateScreenWidth(inputWidth, context) {
    double screenWidth = MediaQuery.of(context).size.width;
    width = (inputWidth / 375.0) * screenWidth;
    return width;
  }

  double getProportionateScreenHeight(inputHeight, context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // 812 is the layout height that designer use
    height = (inputHeight / 812.0) * screenHeight;
    return height;
  }

  onNext() async {
    print(currentPage);
    print(splashData.length - 1);
    if (currentPage < splashData.length - 1) {
      controller.animateToPage(
        controller.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    } else {
      await helper.writeStorage(session.intro, true);
      Get.offAndToNamed(routeName.login);
    }
    update();
  }

  onBack() async {
    print(currentPage);
    print(splashData.length - 1);
    controller.animateToPage(
      controller.page!.toInt() - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
    update();
  }

  onSkip()async{
    await helper.writeStorage(session.intro, true);
    Get.offAndToNamed(routeName.login);
  }
}
