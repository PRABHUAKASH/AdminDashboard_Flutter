import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'drawer_list.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerList(
              title: "Dashboard",
              svgSrc: "assets/icons/Dashboard.svg",
              tap: () {}),
          DrawerList(
              title: "Terminal Actions",
              svgSrc: "assets/icons/Dashboard.svg",
              tap: () {}),
          DrawerList(
              title: "Service Desk",
              svgSrc: "assets/icons/setting.svg",
              tap: () {}),
        ],
      ),
    );
  }
}
