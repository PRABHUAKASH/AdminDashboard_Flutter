import 'package:atmc_admin_dashboard/Screens/components/shimmers/table_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TableExample extends StatefulWidget {
  @override
  State<TableExample> createState() => _TableExampleState();
}

class _TableExampleState extends State<TableExample> {
  Map<String, dynamic> headers = {};
  List<Map<String, dynamic>> rowsData = [];
  bool isLoading = true;

  late MyDataGridSource dataGridSource;

  @override
  void initState() {
    super.initState();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    await fetchHeaders();
    await fetchValues();
    dataGridSource = MyDataGridSource(rowsData, headers.keys.toList());
    setState(() {
      isLoading = false;
    });
  }

  Future<void> fetchHeaders() async {
    try {
      final response = await http.post(
        Uri.parse(
          'https://c079fbd6-c310-495e-af7b-7bb12eedf8f1.mock.pstmn.io/getTxnHistoryTemplate',
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final visibleData = Map.fromEntries(
          data.entries.where(
            (entry) {
              final visibilityLevels = entry.value['visibilityLevels'];
              return visibilityLevels != null &&
                  visibilityLevels.contains('VIEW');
            },
          ),
        );
        headers = visibleData;
      } else {
        print("Failed to fetch headers: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception occurred while fetching headers: $e");
    }
  }

  Future<void> fetchValues() async {
    final response = await http.post(
      Uri.parse(
          'https://65f9a690-b502-4a14-b420-c8e4a9a0b089.mock.pstmn.io/txnHistory'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      rowsData = List<Map<String, dynamic>>.from(data['listOfData'] ?? []);
    } else {
      print("Failed to fetch values: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading || headers.isEmpty || rowsData.isEmpty) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final columnKeys = headers.keys.toList();

    return isLoading
        ? TableShimmerWidget()
        : Scaffold(
            body: SfDataGrid(
            source: dataGridSource,
            columnWidthMode:
                ColumnWidthMode.auto, // Fills available space equally
            columns: columnKeys.map((key) {
              final label = headers[key]?['label'] ?? key;
              return GridColumn(
                columnName: key,
                label: Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  child: Text(label, overflow: TextOverflow.ellipsis),
                ),
              );
            }).toList(),
          ));
  }
}

class MyDataGridSource extends DataGridSource {
  List<DataGridRow> _rows = [];
  final List<String> columnKeys;

  MyDataGridSource(List<Map<String, dynamic>> data, this.columnKeys) {
    _rows = data.map<DataGridRow>((item) {
      return DataGridRow(
        cells: columnKeys.map((key) {
          return DataGridCell<String>(
            columnName: key,
            value: item[key]?.toString() ?? '',
          );
        }).toList(),
      );
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(cell.value.toString(), overflow: TextOverflow.ellipsis),
        );
      }).toList(),
    );
  }
}
