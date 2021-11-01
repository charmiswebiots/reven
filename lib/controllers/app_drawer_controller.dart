import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reven/global/theme/index.dart';
import 'package:reven/global/utility/index.dart';

enum Languages { English, Gujarati, Hindi }

class AppDrawerController extends GetxController {
  Languages? language;
  String name = "";
  String email = "";
  String id = "";

  @override
  void onInit() {
    // TODO: implement onInit

    getLastUpdatedLanguage();
    super.onInit();
  }

  void getLastUpdatedLanguage() async {
    var countryCode = await helper.getStorage(session.countryCode);
    var Language = await helper.getStorage(session.languageCode);
    print("Data :${countryCode} ${Language}");
    if (countryCode != "" && Language != "") {
      language = countryCode == "In" && Language == "hi"
          ? Languages.Hindi
          : countryCode == "In" && Language == "gu"
          ? Languages.Gujarati
          : countryCode == "Us" && Language == "en"
          ? Languages.English
          : Languages.English;
    } else {
      language = Languages.English;
    }
    update();
  }

  updateLanguage(value, value1) async {
    await helper.writeStorage(session.countryCode, value1);
    await helper.writeStorage(session.languageCode, value);
    var locale = Locale(value, value1);
    Get.updateLocale(locale);
    print("Language Update Done");
    update();
  }

  void languageSelection(context) async {
    return showDialog(
        builder: (context) {
          return GetBuilder<AppDrawerController>(
            builder: (_) =>AlertDialog(
              elevation: 2,
              titlePadding: EdgeInsets.all(0),
              title: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                color: appColor.primaryColor,
                height: 55,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.globe,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "LanguageSelection".tr,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              contentPadding: EdgeInsets.all(8),
              content: Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Theme.of(context).accentColor,
                  disabledColor: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        language = Languages.English;
                        var locale = Locale('en', 'Us');
                        updateLanguage('en', 'Us');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          new Radio(
                            value: Languages.English,
                            groupValue: language,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (Languages? value) async {
                              language = value;
                              var locale = Locale('en', 'Us');
                              updateLanguage('en', 'Us');
                            },
                          ),
                          new Text(
                            'English'.tr,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: appScreenUtil.fontSize(16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        language = Languages.Hindi;
                        var locale = Locale('hi', 'In');
                        updateLanguage('hi', 'In');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          new Radio(
                            value: Languages.Hindi,
                            groupValue: language,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (Languages? value) async {
                              language = value;
                              var locale = Locale('hi', 'In');
                              updateLanguage('hi', 'In');
                            },
                          ),
                          new Text(
                            'Hindi'.tr,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: appScreenUtil.fontSize(16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        language = Languages.Gujarati;
                        var locale = Locale('gu', 'In');
                        updateLanguage('gu', 'In');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          new Radio(
                            value: Languages.Gujarati,
                            groupValue: language,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (Languages? value) async {
                              language = value;
                              var locale = Locale('gu', 'In');
                              updateLanguage('gu', 'In');
                            },
                          ),
                          new Text(
                            'Gujarati'.tr,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: appScreenUtil.fontSize(16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        context: context);
  }

  void logoutDialog(context) {
    showDialog(
      builder: (context) => AlertDialog(
        content: Text("Do you really want to logout?"),
        actions: [
          FlatButton(
            child: Text("Yes"),
            onPressed: () async {
              Get.back();

              /*helper.clearStorage();
              Navigator.of(context).pushNamed(routeName.login);*/
            },
          ),
          FlatButton(
            child: Text("No"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      context: context,
    );
  }
}
