import 'package:atmc_admin_dashboard/Screens/components/shimmers/analytic_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/constants.dart';
import '../../../models/analytic_info_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class AnalyticInfoCart extends StatefulWidget {
  const AnalyticInfoCart({Key? key, required this.info}) : super(key: key);

  final AnalyticInfo info;

  @override
  State<AnalyticInfoCart> createState() => _AnalyticInfoCartState();
}

class _AnalyticInfoCartState extends State<AnalyticInfoCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.info.count}",
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.all(appPadding / 2),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: widget.info.color!.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                  widget.info.svgSrc!,
                  color: widget.info.color,
                  height: 20,
                  width: 20,
                ),
              )
            ],
          ),
          Text(widget.info.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }
}
