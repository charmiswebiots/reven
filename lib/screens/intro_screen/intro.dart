import 'package:flutter/material.dart';
import 'package:reven/controllers/intro_controller.dart';
import 'package:reven/global/commonWidget/common/custom_button.dart';
import 'package:reven/global/commonWidget/common/size_config.dart';
import 'package:reven/global/commonWidget/intro_content.dart';
import 'package:reven/global/packages/config_package.dart';
import 'package:reven/screens/intro_screen/intro_commonFields.dart';
import 'package:reven/screens/intro_screen/intro_style.dart';

// This is the best practice

class Intro extends StatelessWidget {
  var introCtrl = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {

    //images list
    final imageList = Expanded(
      flex: 6,
      child: PageView.builder(
        controller: introCtrl.controller,
        onPageChanged: (value) {
          introCtrl.currentPage = value;
          introCtrl.update();
        },
        itemCount: introCtrl.splashData.length,
        itemBuilder: (context, index) => IntroContent(
          image: introCtrl.splashData[index]["image"],
          text: introCtrl.splashData[index]['text'],
          description: introCtrl.splashData[index]['description'],
          width: MediaQuery.of(context).size.width * 200,
          containerheight: 0.9,
          containerwidth: 0.9,
          titlefontSize: 22,
          descriptionfontSize: 16,
          height: introCtrl.getProportionateScreenHeight(400, context),
        ),
      ),
    );

    //dot count list
    final dotList = GetBuilder<IntroController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...introCtrl.splashData.map((e) {
            int index = introCtrl.splashData.indexOf(e);
            return Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: introCtrl.currentPage == index
                    ? appColor.secondary
                    : Colors.white,
                borderRadius: BorderRadius.circular(90),
                border: Border.all(color: appColor.gray),
              ),
            );
          }),
        ],
      ),
    );

    //next and back option
    final dataList = GetBuilder<IntroController>(builder: (controller) =>  Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: introCtrl.getProportionateScreenWidth(20, context)),
        child: Column(
          children: <Widget>[
            Spacer(),
            IntroFields().heightSpacing(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (introCtrl.currentPage != 0)

                  IntroFields().inkWell(
                      onTap: () {
                        introCtrl.onBack();
                      },
                      style: IntroStyle().backText,
                      text: 'BACK'),
                dotList,
                IntroFields().inkWell(
                    onTap: () {
                      introCtrl.onNext();
                    },
                    style: IntroStyle().nextText,
                    text: 'NEXT'),
              ],
            ),
            Spacer(flex: 2),
            CustomButton(
              height: 50,
              title: 'SKIP',
              style: TextStyle(color: Colors.white),
              onTap: () async {
                introCtrl.onSkip();
              },
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    ),);

    return GetBuilder<IntroController>(
      builder: (_) => Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: IntroFields().body(context, imageList, dataList),
        ),
      ),
    );
  }
}
