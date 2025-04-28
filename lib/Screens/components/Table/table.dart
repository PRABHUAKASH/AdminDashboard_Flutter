import 'package:atmc_admin_dashboard/Screens/components/Table/dashboardTable.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class DashboardTable extends StatelessWidget {
  const DashboardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      padding: EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Txn History",
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: TableExample()),
        ],
      ),
    );
  }
}
