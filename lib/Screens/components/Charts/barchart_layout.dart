import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'bar_chart.dart';

class BarChartLayout extends StatelessWidget {
  const BarChartLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
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
                  "Terminal Connectivity ",
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
            Expanded(child: BarChartPage()
                //     ListView.builder(
                //   physics: NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   itemCount: referalData.length,
                //   itemBuilder: (context, index) => ReferalInfoDetail(
                //     info: referalData[index],
                //   ),
                // )
                )
          ],
        ));
  }
}
