import 'package:atmc_admin_dashboard/Screens/components/Charts/radial_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class RadialBarChartLayout extends StatelessWidget {
  const RadialBarChartLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cash Status",
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text(
              //   "View all",
              //   style: TextStyle(
              //     color: primaryColor.withOpacity(0.5),
              //     fontSize: 12,
              //     fontWeight: FontWeight.w600,
              //   ),
              // )
            ],
          ),
          SizedBox(
            height: appPadding,
          ),
          Expanded(child: RadialBarChartPage()),
        ],
      ),
    );
  }
}
