import 'package:atmc_admin_dashboard/Screens/components/shimmers/analytic_card_shimmer.dart';
import 'package:atmc_admin_dashboard/models/analytic_info_model.dart';
import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../constants/responsive.dart';
import 'analytic_info_cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnalyticCards extends StatefulWidget {
  const AnalyticCards({Key? key}) : super(key: key);

  @override
  State<AnalyticCards> createState() => _AnalyticCardsState();
}

class _AnalyticCardsState extends State<AnalyticCards> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Responsive(
      mobile: AnalyticInfoCardGridView(
        crossAxisCount: size.width < 650 ? 2 : 4,
        childAspectRatio: size.width < 650 ? 2 : 1.5,
      ),
      tablet: const AnalyticInfoCardGridView(),
      desktop: AnalyticInfoCardGridView(
        childAspectRatio: size.width < 1400 ? 1.5 : 2.1,
      ),
    );
  }
}

class AnalyticInfoCardGridView extends StatefulWidget {
  const AnalyticInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.4,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  State<AnalyticInfoCardGridView> createState() =>
      _AnalyticInfoCardGridViewState();
}

class _AnalyticInfoCardGridViewState extends State<AnalyticInfoCardGridView> {
  List<AnalyticInfo> analyticResponseData = [];
  bool isLoading = true;

  Future<void> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await http.post(Uri.parse(
        'https://42453945-09d6-484c-bf0e-6d53ecea3141.mock.pstmn.io/successFinTxnStats'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final value = data['listOfData'][0] ?? {};
      setState(() {
        analyticResponseData = [
          AnalyticInfo(
            title: "Success Count Today",
            count: int.tryParse(value['txnCountForDay'].toString()) ?? 0,
            svgSrc: "assets/icons/count.svg",
            color: primaryColor,
          ),
          AnalyticInfo(
            title: "Success Amount Today",
            count: int.tryParse(value['txnAmountForDay'].toString()) ?? 0,
            svgSrc: "assets/icons/money.svg",
            color: purple,
          ),
          AnalyticInfo(
            title: "Success Count This Month",
            count: int.tryParse(value['txnCountForMonth'].toString()) ?? 0,
            svgSrc: "assets/icons/count.svg",
            color: primaryColor,
          ),
          AnalyticInfo(
            title: "Success Amount This Month",
            count: int.tryParse(value['txnAmountForMonth'].toString()) ?? 0,
            svgSrc: "assets/icons/money.svg",
            color: purple,
          ),
        ];
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
    if (analyticResponseData.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return isLoading
        ? AnalyticalCardShimmerWidget()
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: analyticResponseData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.crossAxisCount,
              crossAxisSpacing: appPadding,
              mainAxisSpacing: appPadding,
              childAspectRatio: widget.childAspectRatio,
            ),
            itemBuilder: (context, index) => AnalyticInfoCart(
              info: analyticResponseData[index],
            ),
          );
  }
}
