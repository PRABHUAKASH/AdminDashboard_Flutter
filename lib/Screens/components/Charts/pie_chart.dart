import 'package:atmc_admin_dashboard/Screens/components/shimmers/chart_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PieChartData {
  PieChartData(this.category, this.value);

  final String category;
  final double value;
}

class PieChartPage extends StatefulWidget {
  @override
  State<PieChartPage> createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  List<PieChartData> chartData = [];
  bool isLoading = true;

  Future<void> fetchData() async {
    final response = await http.post(
      Uri.parse(
          'https://a66ebe0d-eab9-4d09-990e-2d7e49b0e684.mock.pstmn.io/txnStatsNonFin'),
    );
    if (response.statusCode == 200) {
      final dynamic decodedJson = json.decode(response.body);

      if (decodedJson is Map<String, dynamic>) {
        final dynamic nonFinancial = decodedJson['nonFinancial'];

        if (nonFinancial is Map<String, dynamic>) {
          final List<PieChartData> data = [];

          nonFinancial.forEach((key, value) {
            if (key != null &&
                value is Map<String, dynamic> &&
                value['txnCount'] != null) {
              final txnCount =
                  double.tryParse(value['txnCount'].toString()) ?? 0;
              final category = key.toString(); // Ensure key is a string
              data.add(PieChartData(category, txnCount));
            }
          });

          setState(() {
            chartData = data;
            isLoading = false;
          });
        } else {
          print('nonFinancial is not a Map<String, dynamic>');
        }
      } else {
        print('Decoded JSON is not a Map<String, dynamic>');
      }
    } else {
      print('Failed to fetch data: ${response.statusCode}');
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
                      legend: Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <CircularSeries>[
                        PieSeries<PieChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (PieChartData data, _) => data.category,
                          yValueMapper: (PieChartData data, _) => data.value,
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                      ],
                    ),
            ),
          );
  }
}
