import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reven/screens/category_screen/category.dart';
import 'package:reven/screens/index.dart';

class DashboardController extends GetxController {

  int selectedIndex = 0;

  List<Widget> widgetOptions = <Widget>[HomeLayout(),Category()];

  Future<bool>? onWillPop(context) {
    if (selectedIndex > 0) {
      selectedIndex = 0;
      update();
    } else {
      appClose(context);
    }
  }

  appClose(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Are you sure".tr),
              content: Text("Do you want to exit an app?".tr),
              actions: [
                new FlatButton(
                  child: Text(
                    "Yes".tr,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                new FlatButton(
                  child: Text(
                    "No".tr,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          );
        });
  }

  navigationbarchange(int index) async {
    selectedIndex = index;
    print('index : ' + index.toString());
    update();

  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  @override
  void onReady()async {
    // TODO: implement onReady
    super.onReady();
  }
}
