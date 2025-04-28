import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildSkeletonLoader() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Column(
      children: [
        // Fake chart
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
        SizedBox(height: 16),
        // Fake table rows
        ...List.generate(
            5,
            (index) => Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 8),
                ))
      ],
    ),
  );
}
