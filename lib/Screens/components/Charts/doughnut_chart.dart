import 'package:atmc_admin_dashboard/Screens/components/shimmers/chart_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:atmc_admin_dashboard/data/data.dart';

class DoughnutChartPage extends StatefulWidget {
  @override
  State<DoughnutChartPage> createState() => _DoughnutChartPageState();
}

class _DoughnutChartPageState extends State<DoughnutChartPage> {
  List<ChartData> chartData = [];
  bool isLoading = true;

  Future<void> fetchData() async {
    final response = await http.post(Uri.parse(
      'https://c31decad-0f0b-488e-ab99-8deecbd1485a.mock.pstmn.io/monitorTxnStatsFin',
    ));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      // Extract the list from the "listOfData" key
      final List<dynamic> list = responseData['listOfData'] ?? [];

      final List<ChartData> generatedData = list.map((item) {
        return ChartData(
          item['name'].toString(),
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
        : Scaffold(
            body: Center(
              child: chartData.isEmpty
                  ? CircularProgressIndicator()
                  : SfCircularChart(
                      backgroundColor: Colors.white,
                      legend: Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        header: '',
                        format: 'point.x: point.y',
                      ),
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.category,
                          yValueMapper: (ChartData data, _) => data.value,
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        )
                      ],
                    ),
            ),
          );
  }
}
