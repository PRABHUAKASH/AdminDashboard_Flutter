import 'package:atmc_admin_dashboard/Screens/components/Charts/barchart_layout.dart';
import 'package:atmc_admin_dashboard/Screens/components/Table/table.dart';
import 'package:atmc_admin_dashboard/Screens/components/Charts/piechart_layout.dart';
import 'package:atmc_admin_dashboard/Screens/components/viewers.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import 'AnalyticalCards/analytic_cards.dart';
import 'custom_appbar.dart';
import 'Charts/radial_barchart_layout.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Padding(
      padding: EdgeInsets.all(appPadding),
      child: Column(
        children: [
          CustomAppbar(),
          SizedBox(
            height: appPadding,
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        AnalyticCards(),
                        SizedBox(
                          height: appPadding,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: appPadding,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!Responsive.isMobile(context))
                              Expanded(flex: 2, child: BarChartLayout()),
                            if (!Responsive.isMobile(context))
                              SizedBox(
                                width: appPadding,
                              ),
                            Expanded(
                              child: Viewers(),
                              flex: 2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: appPadding,
                        ),
                        if (Responsive.isMobile(context))
                          SizedBox(
                            height: appPadding,
                          ),
                        if (Responsive.isMobile(context)) BarChartLayout(),
                        if (Responsive.isMobile(context))
                          SizedBox(
                            height: appPadding,
                          ),
                        if (Responsive.isMobile(context)) PieChartLayout()
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(
                      width: appPadding,
                    ),
                  if (!Responsive.isMobile(context))
                    Expanded(flex: 2, child: PieChartLayout())
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        if (Responsive.isMobile(context))
                          SizedBox(
                            height: appPadding,
                          ),
                        DashboardTable(),
                        if (Responsive.isMobile(context))
                          SizedBox(
                            height: appPadding,
                          ),
                        if (Responsive.isMobile(context)) RadialBarChartLayout()
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(
                      width: appPadding,
                    ),
                  if (!Responsive.isMobile(context))
                    Expanded(flex: 2, child: RadialBarChartLayout())
                ],
              ),
            ],
          ),
        ],
      ),
    )));
  }
}
