import 'package:atmc_admin_dashboard/Screens/components/shimmers/chart_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:atmc_admin_dashboard/data/data.dart';

// class ChartData {
//   final String category;
//   final double value;

//   ChartData(this.category, this.value);
// }

class BarChartPage extends StatefulWidget {
  @override
  State<BarChartPage> createState() => _BarChartPageState();
}

class _BarChartPageState extends State<BarChartPage> {
  List<ChartData> chartData = [];
  bool isLoading = true;

  Future<void> fetchData() async {
    final response = await http.post(Uri.parse(
        'https://97bd909c-f97c-40c4-82e6-0c44cd9dd283.mock.pstmn.io/tlCountStatusBased'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final Map<String, dynamic> values = responseData[0];
      final List<ChartData> generatedData = [];
      values.forEach((key, value) {
        if (key != 'id') {
          generatedData
              .add(ChartData(key, double.tryParse(value.toString()) ?? 0));
        }
      });

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
                  : SfCartesianChart(
                      backgroundColor: Colors.white,
                      primaryXAxis: CategoryAxis(),
                      legend: Legend(isVisible: false),
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        header: '',
                        format: 'point.x: point.y',
                      ),
                      series: <CartesianSeries>[
                        ColumnSeries<ChartData, String>(
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
