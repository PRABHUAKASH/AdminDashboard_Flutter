import 'package:atmc_admin_dashboard/Screens/components/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/dashboard_screen.dart';
import 'controllers/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => Controller())],
        // child: LoginPage(
        child: DashboardScreen(),
        // ),
        // child: DashboardScreen(),
      ),
    );
  }
}
