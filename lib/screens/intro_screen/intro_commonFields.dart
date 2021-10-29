import 'package:flutter/material.dart';
import 'package:reven/global/packages/config_package.dart';
import 'package:reven/screens/intro_screen/intro_style.dart';
import 'package:reven/screens/login_screen/login_style.dart';

class IntroFields {

  //get title
  getTextTitle(String? title, Color? color,
      {double? letterSpacing, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      title!,
      style: IntroStyle()
          .titleTextStyle(color, fontWeight, letterSpacing, fontSize),
    );
  }

  //sizedbox height
  final heightSpacing = (double data) => SizedBox(
        height: appScreenUtil.size(data),
      );

  final text = (data, style) => Text(
        data,
        style: style,
      );

  //get button
  final inkWell = ({GestureTapCallback? onTap,text,style}) => InkWell(
        onTap: onTap,
        child: IntroFields().text(text, style),
      );

  final body = (BuildContext context, imageList, dataList) => Column(
        children: <Widget>[
          IntroFields().heightSpacing(10),
          imageList,
          dataList,
        ],
      );
}
