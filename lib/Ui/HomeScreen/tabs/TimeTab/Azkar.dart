import 'package:flutter/material.dart';

import '../../../../Utils/AppAssets.dart';
import '../../../../Utils/AppColors.dart';
import '../../../../Utils/AppStyles.dart';

class Azkar extends StatelessWidget {
  String azkarIcon;

  String azkarName;

  Azkar({
    required this.azkarIcon,
    required this.azkarName,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(azkarIcon),
          Text(azkarName, style: AppStyles.bold20White),
        ],
      ),
      width: width * .45,
      height: height * .3,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: AppColors.gold,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
