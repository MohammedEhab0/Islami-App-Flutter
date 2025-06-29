import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'HadethItem.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
          enlargeFactor: .1,
          viewportFraction: .83,
          enlargeCenterPage: true,
          height: height * .7),
      items: List.generate(50, (index) => index + 1).map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(),
                child: HadethItem(
                  index: i,
                ));
          },
        );
      }).toList(),
    );
  }
}
