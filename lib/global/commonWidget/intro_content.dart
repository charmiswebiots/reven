import 'package:flutter/material.dart';
import 'package:reven/global/packages/config_package.dart';

import 'common/size_config.dart';

class IntroContent extends StatelessWidget {
  const IntroContent({
    Key? key,
    this.text,
    this.description,
    this.image,
    this.height,
    this.width,
    this.containerheight,
    this.containerwidth,
    this.titlefontSize,
    this.descriptionfontSize,
  }) : super(key: key);
  final String? text, image,description;
  final double? height, width, containerheight, containerwidth,titlefontSize,descriptionfontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(flex: 50,),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      width: MediaQuery.of(context).size.width * containerwidth!,
                      height: MediaQuery.of(context).size.width * containerheight!,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.2),
                            Colors.grey.withOpacity(0.2),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      width: MediaQuery.of(context).size.width * (containerwidth! - 0.2),
                      height: MediaQuery.of(context).size.width * (containerheight! - 0.2),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.4),
                            Colors.grey.withOpacity(0.4),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      image!,
                      height: height,
                      width: width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 25,),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: titlefontSize,
            color: appColor.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10,),
        Text(
          description!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: appColor.primaryColor,
          ),
        ),

      ],
    );
  }
}
