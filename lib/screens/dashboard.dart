import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reven/controllers/dashboard_controller.dart';
import 'package:reven/global/assets/index.dart';
import 'package:reven/global/theme/index.dart';
import 'package:reven/screens/drawer.dart';

class Dashboard extends StatelessWidget {
  var dahboardCtrl = Get.put(DashboardController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (_) => WillPopScope(
        onWillPop: () async {
          dahboardCtrl.appClose(context);
          return false;
        },
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Image.asset(
              imageAssets.logo,
              height: 50,
            ),
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: appColor.whiteColor,
            leading: InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Icon(
                CupertinoIcons.text_justifyleft,
                color: appColor.primaryColor,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.bell,
                      color: appColor.primaryColor,
                      size: 26,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.heart,
                      color: appColor.primaryColor,
                      size: 26,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Stack(
                      children: [
                        Icon(
                          CupertinoIcons.bag,
                          color: appColor.primaryColor,
                          size: 26,
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 5),
                            decoration: BoxDecoration(
                                color: appColor.primaryDarkColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              '2',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          drawer: AppDrawer(),
          drawerScrimColor: appColor.primaryColor,
          body:
              dahboardCtrl.widgetOptions.elementAt(dahboardCtrl.selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: dahboardCtrl.selectedIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: appColor.primaryColor,
            unselectedItemColor: Colors.grey.withOpacity(.80),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: (value) {
              // Respond to item press.
              dahboardCtrl.navigationbarchange(value);
            },
            items: [
              BottomNavigationBarItem(
                title: Text(
                  'HOME',
                ),
                icon: Icon(CupertinoIcons.home,color: dahboardCtrl.selectedIndex == 0
                    ? appColor.secondary
                    : Colors.grey.withOpacity(.80),),
              ),
              BottomNavigationBarItem(
                title: Text('CATEGORY'),
                icon:
                    /*Image.asset(
                  'assets/images/category.png',
                  height: dahboardCtrl.selectedIndex == 1 ? 40 : 30,
                  width: dahboardCtrl.selectedIndex == 1 ? 40 : 30,
                  color: dahboardCtrl.selectedIndex == 1
                      ? Color(0xFFABB747)
                      : Colors.grey.withOpacity(.80),
                )*/
                    Icon(
                  CupertinoIcons.circle_grid_3x3,
                  color: dahboardCtrl.selectedIndex == 1
                      ? appColor.secondary
                      : Colors.grey.withOpacity(.80),
                ),
              ),
              /*BottomNavigationBarItem(
                title: Text('CURATE'),
                icon: Image.asset(
                  'assets/images/curate.png',
                  height: dahboardCtrl.selectedIndex == 2 ? 40 : 30,
                  width: dahboardCtrl.selectedIndex == 2 ? 40 : 30,
                  color: dahboardCtrl.selectedIndex == 2
                      ? Color(0xFFABB747)
                      : Colors.grey.withOpacity(.80),
                ),
              ),
              BottomNavigationBarItem(
                title: Text('SALE'),
                icon: Image.asset(
                  'assets/images/sale.png',
                  height: dahboardCtrl.selectedIndex == 3 ? 40 : 30,
                  width: dahboardCtrl.selectedIndex == 3 ? 40 : 30,
                  color: dahboardCtrl.selectedIndex == 3
                      ? Color(0xFFABB747)
                      : Colors.grey.withOpacity(.80),
                ),
              ),
              BottomNavigationBarItem(
                title: Text('MORE'),
                icon: Image.asset(
                  'assets/images/more.png',
                  height: dahboardCtrl.selectedIndex == 4 ? 40 : 30,
                  width: dahboardCtrl.selectedIndex == 4 ? 40 : 30,
                  color: dahboardCtrl.selectedIndex == 4
                      ? Color(0xFFABB747)
                      : Colors.grey.withOpacity(.80),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
