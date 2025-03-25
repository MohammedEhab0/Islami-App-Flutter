import 'package:flutter/material.dart';
import 'package:islami/Utils/AppColors.dart';

import '../../../../Utils/AppStyles.dart';

class SuraContent extends StatelessWidget {
  int index;
  String aya;

  SuraContent({required this.index, required this.aya});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gold, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        textAlign: TextAlign.center,
        '[${index + 1}] ${aya}',
        style: AppStyles.bold16gold,
      ),
    );
  }
}
