import 'package:flutter/material.dart';
import 'package:islami/Ui/HomeScreen/tabs/QuranTab/MostRecent.dart';
import 'package:islami/Ui/HomeScreen/tabs/QuranTab/QuranDetails.dart';
import 'package:islami/Ui/HomeScreen/tabs/QuranTab/SuraList.dart';
import 'package:islami/Utils/AppAssets.dart';
import 'package:islami/Utils/AppColors.dart';
import 'package:islami/Utils/AppStyles.dart';
import 'package:islami/Utils/QuranContent.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/MostRecentProviders.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);
  late MostRecentProviders provider;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    provider = Provider.of<MostRecentProviders>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * .0465),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(),
          Padding(
              padding: EdgeInsets.symmetric(vertical: height * .01),
              child: TextField(
                style: AppStyles.bold16White,
                onChanged: (newText) {
                  filterByNewText(newText);
                },
                cursorColor: AppColors.gold,
                decoration: InputDecoration(
                    hintText: 'Sura Name',
                    hintStyle: AppStyles.bold16White,
                    prefixIcon: ImageIcon(
                      AssetImage(
                        AppAssets.quranIcon,
                      ),
                      color: AppColors.gold,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: AppColors.gold, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: AppColors.gold, width: 2))),
              )),
          MostRecent(),
          SizedBox(height: height * .02),
          Text(
            'Suras List',
            style: AppStyles.bold16White,
          ),
          SizedBox(height: height * .02),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(QuranDetails.routeName,
                          arguments: filterList[index]);
                      provider.updateMostResentList(filterList[index]);
                    },
                    child: SuraList(
                      index: filterList[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * .03,
                    child: Divider(
                      color: AppColors.White,
                      thickness: 1,
                      indent: width * .09,
                      endIndent: width * .09,
                    ),
                  );
                },
                itemCount: filterList.length),
          ),
        ],
      ),
    );
  }

  void filterByNewText(String newText) {
    List<int> newFilterList = [];
    for (int i = 0; i < QuranContent.arabicAuranSuras.length; i++) {
      if (QuranContent.arabicAuranSuras[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        newFilterList.add(i);
      } else if (QuranContent.englishQuranSurahs[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        newFilterList.add(i);
      }
    }
    filterList = newFilterList;
    setState(() {});
  }
}
