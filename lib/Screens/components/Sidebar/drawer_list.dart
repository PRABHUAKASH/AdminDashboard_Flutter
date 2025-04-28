import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/constants.dart';

class DrawerList extends StatelessWidget {
  const DrawerList(
      {Key? key, required this.title, required this.svgSrc, required this.tap})
      : super(key: key);

  final String title, svgSrc;
  final VoidCallback tap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tap,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: grey,
        height: 20,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          title,
          style: TextStyle(
            color: const Color.fromARGB(255, 14, 57, 155),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
