import 'package:flutter/material.dart';
import 'package:islami/Utils/AppAssets.dart';
import 'package:islami/Utils/AppColors.dart';
import 'package:islami/Utils/AppStyles.dart';

import '../../../../model/radios.dart'; // Your radio model class
import '../../../../model/reciters.dart';

class RadioListWidget extends StatelessWidget {
  final List<Reciter>? reciterList;
  final List<RadioItem>? radioList;

  const RadioListWidget({
    super.key,
    this.radioList,
    this.reciterList,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final isRadio = radioList != null;

    final int itemCount =
        isRadio ? radioList!.length : reciterList?.length ?? 0;

    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: height * 0.008),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final String title = isRadio
            ? radioList![index].name ?? 'No Name'
            : reciterList![index].name ?? 'No Name';

        return Container(
          padding: EdgeInsets.only(top: height * 0.01),
          width: width * 0.8,
          height: height * 0.18,
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppStyles.bold18black),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(AppAssets.BotomShape, color: AppColors.Gray),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: width * 0.13),
                      const Icon(Icons.play_arrow_rounded, size: 44),
                      const Icon(Icons.volume_down_rounded, size: 44),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: height * 0.019),
    );
  }
}
