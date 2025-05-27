import '../constants/constants.dart';
import '../models/analytic_info_model.dart';

List analyticData = [
  AnalyticInfo(
    title: "Success Count Today",
    count: 720,
    svgSrc: "assets/icons/count.svg",
    color: primaryColor,
  ),
  AnalyticInfo(
    title: "Success Amount Today",
    count: 820,
    svgSrc: "assets/icons/money.svg",
    color: purple,
  ),
  AnalyticInfo(
    title: "Success Count This Month",
    count: 920,
    svgSrc: "assets/icons/count.svg",
    color: primaryColor,
  ),
  AnalyticInfo(
    title: "Success Amount This Month",
    count: 920,
    svgSrc: "assets/icons/money.svg",
    color: purple,
  ),
];

class ChartData {
  ChartData(this.category, this.value);
  final String category;
  final double value;
}
