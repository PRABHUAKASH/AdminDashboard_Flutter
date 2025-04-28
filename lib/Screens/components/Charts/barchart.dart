import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class BarchartPage extends StatelessWidget {
  const BarchartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.white, width: 1),
        ),
        groupsSpace: 15,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
              showTitles: true,
              // getTextStyles: (value) => const TextStyle(
              //       color: lightTextColor,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 12,
              //     ),
              margin: appPadding,
              getTitles: (double value) {
                if (value == 1) {
                  return "InService";
                } else if (value == 2) {
                  return "Active";
                } else {
                  return " Down";
                }
              }),
          // leftTitles: SideTitles(
          // showTitles: true,
          // getTextStyles: (value) => const TextStyle(
          //       color: lightTextColor,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 12,
          //     ),
          // margin: appPadding,
          // getTitles: (double value) {
          //   if (value == 1) {
          //     return "InService";
          //   } else if (value == 2) {
          //     return "Active";
          //   } else {
          //     return " Down";
          //   }
          // }),
        ),
        barGroups: [
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(
              y: 5,
              width: 20,
              colors: [primaryColor],
              borderRadius: BorderRadius.circular(5),
            )
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
              y: 9,
              width: 20,
              colors: [primaryColor],
              borderRadius: BorderRadius.circular(5),
            )
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
              y: 7,
              width: 20,
              colors: [primaryColor],
              borderRadius: BorderRadius.circular(5),
            )
          ]),
        ]));
  }
}
