import 'package:atmc_admin_dashboard/Screens/components/shimmers/chart_shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:atmc_admin_dashboard/data/data.dart';

class RadialBarChartPage extends StatefulWidget {
  @override
  State<RadialBarChartPage> createState() => _RadialBarChartPageState();
}

class _RadialBarChartPageState extends State<RadialBarChartPage> {
  List<ChartData> chartData = [];
  bool isLoading = true;
  Future<void> fetchData() async {
    final response = await http.post(Uri.parse(
      'https://663ccac6-a412-4ed0-a04d-33be337d3752.mock.pstmn.io/terminalCountByCash',
    ));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      // Extract the list from the "listOfData" key
      final List<dynamic> list = responseData['listOfData'] ?? [];

      final List<ChartData> generatedData = list.map((item) {
        return ChartData(
          item['status'].toString(),
          double.tryParse(item['count'].toString()) ?? 0,
        );
      }).toList();

      setState(() {
        chartData = generatedData;
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? ChartShimmerWidget()
        : Container(
            color: Colors.white,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SfCircularChart(
                  legend: Legend(isVisible: true),
                  tooltipBehavior: TooltipBehavior(
                    enable: true, // Enable tooltips
                    header:
                        '', // Optional header, can be left empty or customized
                    format:
                        'point.x: point.y', // Format of the tooltip (e.g., category: value)
                  ),
                  series: <CircularSeries>[
                    RadialBarSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.category,
                      yValueMapper: (ChartData data, _) => data.value,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
