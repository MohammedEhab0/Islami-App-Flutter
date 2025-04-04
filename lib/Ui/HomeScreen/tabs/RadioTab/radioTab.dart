import 'package:flutter/material.dart';
import 'package:islami/Ui/HomeScreen/tabs/RadioTab/RadioItem.dart';
import 'package:islami/Utils/AppColors.dart';

import '../../../../Utils/RadioData.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;
  List<Widget> radiotabs = [
    RadioItem(
      itemCount: RadioData.Radio.length,
      radioList: RadioData.Radio,
    ),
    RadioItem(
      itemCount: RadioData.Reciters.length,
      radioList: RadioData.Reciters,
    )
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * .04),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: radioButton(index: 0)),
              SizedBox(width: width * .05),
              Expanded(
                child: radioButton(index: 1),
              ),
            ],
          ),
          Expanded(child: radiotabs[selectedIndex])
        ],
      ),
    );
  }

  radioButton({required int index}) {
    return selectedIndex == index
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.Black,
              foregroundColor: AppColors.White,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              selectedIndex = index;
            },
            child: Text('Radio'),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.Black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              selectedIndex = index;
              setState(() {});
            },
            child: Text('Radio'),
          );
  }
}
