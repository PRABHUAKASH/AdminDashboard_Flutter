
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Stack(
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    "assets/icons/bell.svg",
                    height: 25,
                    color: textColor.withOpacity(0.8),
                  ),
                  Positioned(
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                    top: 0,
                    right: 0,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(appPadding),
          child: Stack(
            children: [
              Icon(Icons.menu, color: textColor.withOpacity(0.5), size: 25),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: appPadding),
          padding: EdgeInsets.symmetric(
            horizontal: appPadding,
            vertical: appPadding / 2,
          ),
          child: Row(
            children: [
              Icon(Icons.person, color: textColor.withOpacity(0.5), size: 25),
              // CircleAvatar(
              //   radius: 20,
              //   backgroundImage: NetworkImage(
              //     "https://images.unsplash.com/photo-1502685104226-e9df14d4d9d0?ixlib=rb-4.0.3&crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
              //   ),
              // ),
              SizedBox(width: appPadding / 2),
              if (!Responsive.isMobile(context))
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Admin",
                    style: TextStyle(
                      color: textColor.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
