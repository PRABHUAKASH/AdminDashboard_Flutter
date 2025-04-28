import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/responsive.dart';
import '../controllers/controller.dart';
import 'components/dashboard_content.dart';
import 'components/Sidebar/drawer_menu.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 245),
      drawer: DrawerMenu(),
      key: context.read<Controller>().scaffoldKey,
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context)) Expanded(child: DrawerMenu()),
          Expanded(flex: 5, child: DashboardContent())
        ],
      )),
    );
  }
}
