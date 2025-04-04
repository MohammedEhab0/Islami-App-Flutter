import 'package:flutter/material.dart';
import 'package:islami/Utils/AppColors.dart';
import 'package:islami/Utils/AppStyles.dart';
import 'package:islami/Utils/TimeData.dart';

class TimeItem extends StatelessWidget {
  int index;

  TimeItem({required this.index});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.shadow),
      width: width * .35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            TimeData.prayTimeList[index].prayName,
            style: AppStyles.bold16White,
          ),
          Text(
            TimeData.prayTimeList[index].prayClock,
            style: AppStyles.bold20White,
          ),
          Text(
            TimeData.prayTimeList[index].AmOrPm,
            style: AppStyles.bold16White,
          )
        ],
      ),
    );
  }
}
