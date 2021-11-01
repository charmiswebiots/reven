import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reven/controllers/app_drawer_controller.dart';
import 'package:reven/global/utility/index.dart';


class AppDrawer extends StatelessWidget {
  var drawerCtrl = Get.put(AppDrawerController());
  /*final Driver? userData;

  const AppDrawer({Key key, this.userData}) : super(key: key);
*/
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppDrawerController>(
      builder: (_) => Drawer(

          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.clear,
                              )),
                          const SizedBox(height: 20),
                          Row(
                            children: [

                              Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                     'name',
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: appScreenUtil.fontSize(15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "dhruvikapdi@gmail.com",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.user, color: Theme.of(context).accentColor,size: 20,),
                      title: Text(
                        'My Profile',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        //drawerCtrl.languageSelection(context);

                        //Get.toNamed(routeName.myprofile, arguments: userData);
                      },
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.user, color: Theme.of(context).accentColor,size: 20,),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product List',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                      onTap: () {
                        Get.back();
                       // drawerCtrl.languageSelection(context);

                        //Get.toNamed(routeName.myprofile, arguments: userData);
                      },
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.cartPlus, color: Theme.of(context).accentColor,size: 20,),
                      title: Text(
                        'My Cart',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onTap: () {
                        Get.back();

                        //Get.toNamed(routeName.myprofile, arguments: userData);
                      },
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.firstOrder, color: Theme.of(context).accentColor,size: 20,),
                      title: Text(
                        'Order List',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        //Get.toNamed(routeName.myprofile, arguments: userData);
                      },
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.phone, color: Theme.of(context).accentColor,size: 20,),
                      title: Text(
                        'Contact Us',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        drawerCtrl.languageSelection(context);

                        //Get.toNamed(routeName.myprofile, arguments: userData);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.privacy_tip_outlined, color: Theme.of(context).accentColor,size: 20,),
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        drawerCtrl.languageSelection(context);

                        //Get.toNamed(routeName.myprofile, arguments: userData);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.file_copy_outlined, color: Theme.of(context).accentColor,size: 20,),
                      title: Text(
                        'Terms & Condition',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        //Get.toNamed(routeName.myprofile, arguments: userData);
                      },
                    ),
                   /* ListTile(
                      leading: Icon(FontAwesomeIcons.users, color: Theme.of(context).accentColor,size: 20,),
                      title: Text(
                        'Language'.tr,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        drawerCtrl.languageSelection(context);

                        //Get.toNamed(routeName.myprofile, arguments: userData);
                      },
                    ),
*/
                    ListTile(
                      leading: Icon(Icons.power_settings_new_outlined, color: Theme.of(context).accentColor),
                      title: Text(
                        'logout'.tr,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onTap: () {
                        drawerCtrl.logoutDialog(context);
                       // fBox.logout(context);
                        // fBox.timer?.cancel();
                        // helper.removeSpecificKeyStorage(session.driverSession);
                        // Get.toNamed(routeName.login);
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Version: 1.0.1",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
