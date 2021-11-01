import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//app file
import 'package:reven/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:reven/global/packages/config_package.dart';
import 'package:reven/screens/drawer.dart';

class HomeLayout extends StatelessWidget {
  var homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => WillPopScope(
        onWillPop: () async {
          // homeCtrl.appClose(context);
          return false;
        },
        child: Scaffold(
          body: Center(
            child: Container(
              child: Text('Home'),
            ),
          ),
        ),
      ),
    );
  }
}
