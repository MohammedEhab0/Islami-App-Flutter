import 'package:flutter/material.dart';
import 'package:islami/Ui/HomeScreen/tabs/hadethTab.dart';
import 'package:islami/Ui/HomeScreen/tabs/quranTab.dart';
import 'package:islami/Ui/HomeScreen/tabs/radioTab.dart';
import 'package:islami/Ui/HomeScreen/tabs/sebhaTab.dart';
import 'package:islami/Ui/HomeScreen/tabs/timeTab.dart';

import '../../Utils/AppAssets.dart';
import '../../Utils/AppColors.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabsList = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];
  List<String> bgList = [
    AppAssets.quran,
    AppAssets.hadeth,
    AppAssets.sebha,
    AppAssets.radio,
    AppAssets.time
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          color: AppColors.shadow,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      bgList[selectedIndex],
                    ),
                    fit: BoxFit.fill,
                    colorFilter:
                        ColorFilter.mode(AppColors.shadow, BlendMode.darken))),
          ),
        ),
        Scaffold(
          body: Column(
            children: [
              Image.asset(AppAssets.Loge, height: height * .164),
              Expanded(child: tabsList[selectedIndex]),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              unselectedItemColor: AppColors.Black,
              selectedItemColor: AppColors.White,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.gold,
              items: [
                BottomNavigationBarItem(
                    label: 'quran',
                    icon: builtBottomNavigationBarItem(
                        index: 0, image: AppAssets.quranIcon)),
                BottomNavigationBarItem(
                    label: 'hadeth',
                    icon: builtBottomNavigationBarItem(
                        index: 1, image: AppAssets.hadethIcon)),
                BottomNavigationBarItem(
                    label: 'sebha',
                    icon: builtBottomNavigationBarItem(
                        index: 2, image: AppAssets.sebhaIcon)),
                BottomNavigationBarItem(
                    label: 'radio',
                    icon: builtBottomNavigationBarItem(
                        index: 3, image: AppAssets.radioIcon)),
                BottomNavigationBarItem(
                    label: 'time',
                    icon: builtBottomNavigationBarItem(
                        index: 4, image: AppAssets.timeIcon)),
              ]),
        )
      ],
    );
  }

  builtBottomNavigationBarItem({required int index, required String image}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.shadow),
            child: ImageIcon(AssetImage(image)))
        : ImageIcon(AssetImage(image));
  }
}
