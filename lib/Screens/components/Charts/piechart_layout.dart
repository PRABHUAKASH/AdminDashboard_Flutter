import 'package:atmc_admin_dashboard/Screens/components/Charts/pie_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class PieChartLayout extends StatelessWidget {
  const PieChartLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: appPadding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Non - Fin Transactions",
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: appPadding),
              padding: EdgeInsets.all(appPadding / 2),
              height: 230,
              child: PieChartPage(),
              //  CustomPaint(
              //   foregroundPainter: RadialPainter(
              //     bgColor: textColor.withOpacity(0.1),
              //     lineColor: primaryColor,
              //     percent: 0.7,
              //     width: 18,
              //   ),
              //   child: Center(
              //     child: Text(
              //       "70%",
              //       style: TextStyle(
              //         color: textColor,
              //         fontSize: 30,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // )
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Row(
            //       children: [
            //         Icon(
            //           Icons.circle,
            //           size: 10,
            //           color: primaryColor,
            //         ),
            //         SizedBox(
            //           width: appPadding / 2,
            //         ),
            //         Text(
            //           "Success",
            //           style: TextStyle(
            //             color: textColor,
            //             fontSize: 15,
            //           ),
            //         )
            //       ],
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: appPadding,
            //       ),
            //       child: Row(
            //         children: [
            //           Icon(
            //             Icons.circle,
            //             size: 10,
            //             color: textColor.withOpacity(0.2),
            //           ),
            //           SizedBox(
            //             width: appPadding / 2,
            //           ),
            //           Text(
            //             "Decline",
            //             style: TextStyle(
            //               color: textColor,
            //               fontSize: 15,
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
