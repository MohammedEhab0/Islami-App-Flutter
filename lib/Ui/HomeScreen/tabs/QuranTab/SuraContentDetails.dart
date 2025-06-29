import 'package:flutter/material.dart';
import 'package:islami/Utils/AppColors.dart';

import '../../../../Utils/AppStyles.dart';

class SuraContent extends StatelessWidget {
  final int index;
  final int selectedindex;
  final String aya;
  final Function selectAya;

  const SuraContent({
    super.key,
    required this.index,
    required this.aya,
    required this.selectAya,
    required this.selectedindex,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectAya();
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selectedindex == index ? AppColors.gold : Colors.transparent,
          border: Border.all(
            color: selectedindex == index ? AppColors.Black : AppColors.gold,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          textAlign: TextAlign.center,
          '[${index + 1}] $aya',
          style: selectedindex == index
              ? AppStyles.bold16black
              : AppStyles.bold16gold,
        ),
      ),
    );
  }
}