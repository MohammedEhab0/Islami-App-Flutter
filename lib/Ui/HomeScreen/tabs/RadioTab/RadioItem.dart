import 'package:flutter/material.dart';
import 'package:islami/Utils/AppAssets.dart';
import 'package:islami/Utils/AppStyles.dart';

import '../../../../Utils/AppColors.dart';
import '../../../../model/reciters.dart';

class RadioItem extends StatelessWidget {
  List<Reciter> radioList;

  int itemCount;

  RadioItem({super.key, required this.itemCount, required this.radioList});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView.separated(
        padding: EdgeInsets.symmetric(vertical: height * .008),
        itemBuilder: (context, int index) {
          return Container(
            padding: EdgeInsets.only(
              top: height * .01,
            ),
            width: width * .8,
            height: height * .16,
            decoration: BoxDecoration(
                color: AppColors.gold, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  radioList[index].name!,
                  style: AppStyles.bold18black,
                ),
                Stack(alignment: Alignment.center, children: [
                  Image.asset(
                    AppAssets.BotomShape,
                    color: AppColors.Gray,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * .13,
                      ),
                      Icon(
                        Icons.play_arrow_rounded,
                        size: 44,
                      ),
                      Icon(
                        Icons.volume_down_rounded,
                        size: 44,
                      )
                    ],
                  )
                ])
              ],
            ),
          );
        },
        separatorBuilder: (context, int index) {
          return SizedBox(
            height: height * .019,
          );
        },
        itemCount: itemCount);
  }
}
