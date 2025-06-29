import 'package:flutter/material.dart';

import '../../../../Utils/AppAssets.dart';
import '../../../../Utils/AppStyles.dart';
import '../../../../Utils/QuranContent.dart';

class SuraList extends StatelessWidget {
  int index;

  SuraList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.ayaIcon),
              Text('${index + 1}', style: AppStyles.bold16White)
            ],
          ),
          SizedBox(width: width * .08),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranContent.englishQuranSurahs[index],
                style: AppStyles.bold20White,
              ),
              SizedBox(height: height * .01),
              Text(
                '${QuranContent.AyaNumber[index]} Verses',
                style: AppStyles.bold16White,
              ),
            ],
          ),
          Spacer(),
          Text(
            QuranContent.arabicAuranSuras[index],
            style: AppStyles.bold20White,
          )
        ],
      ),
    );
  }
}
