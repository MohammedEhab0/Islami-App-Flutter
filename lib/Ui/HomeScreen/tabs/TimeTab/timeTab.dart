import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/Ui/HomeScreen/tabs/TimeTab/Azkar.dart';

import '../../../../Utils/AppAssets.dart';
import '../../../../Utils/AppColors.dart';
import '../../../../Utils/AppStyles.dart';
import '../../../../Utils/TimeData.dart';
import 'TimeItem.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: width * 0.92,
          height: height * 0.32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.gold,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.Brown,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Pray Time', style: AppStyles.bold16White),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        color: AppColors.gold,
                      ),
                      child: Column(
                        children: [
                          Text('Pray Time', style: AppStyles.bold18black),
                          Text('Tuesday', style: AppStyles.bold18black),
                        ],
                      ),
                    ),
                    Text('Pray Time', style: AppStyles.bold16White),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * .025),
                child: CarouselSlider(
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    enlargeFactor: 0.22,
                    viewportFraction: 0.33,
                    enlargeCenterPage: true,
                    height: height * 0.17,
                  ),
                  items: List.generate(5, (index) => index).map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          child: TimeItem(
                            index: i,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Text(
                currentIndex < TimeData.prayTimeList.length - 1
                    ? 'Next Pray ${TimeData.prayTimeList[currentIndex + 1].prayClock}'
                    : 'No more prayers today',
                style: AppStyles.bold16black,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Azkar', style: AppStyles.bold20White),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Azkar(
              azkarIcon: AppAssets.morningAzkar,
              azkarName: 'MorningAzkar',
            ),
            Azkar(azkarIcon: AppAssets.eveningAzkar, azkarName: 'EveningAzkar')
          ],
        )
      ],
    );
  }
}
