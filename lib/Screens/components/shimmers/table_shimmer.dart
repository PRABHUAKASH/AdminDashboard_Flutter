import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TableShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: List.generate(
            5,
            (index) => Container(
                  width: double.infinity,
                  height: 30,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                )),
      ),
    );
  }
}
