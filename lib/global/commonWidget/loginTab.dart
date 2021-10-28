import 'package:flutter/material.dart';
import 'package:reven/global/theme/index.dart';

class LoginTab extends StatelessWidget {
  TabController? tabController;
  LoginTab({Key? key,this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 55,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xFFDDDBDF),
        borderRadius: BorderRadius.circular(
          25.0,
        ),
      ),
      child: TabBar(
        controller: tabController,
        // give the indicator a decoration (color and border radius)
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25.0,
          ),
          color: Colors.white,
        ),
        labelColor: appColor.primaryColor,
        unselectedLabelColor: Colors.black,
        tabs: [
          // first tab [you can add an icon using the icon property]
          Tab(
            text: 'EmailId',
          ),

          // second tab [you can add an icon using the icon property]
          Tab(
            text: 'Mobile',
          ),
        ],
      ),
    );
  }
}
