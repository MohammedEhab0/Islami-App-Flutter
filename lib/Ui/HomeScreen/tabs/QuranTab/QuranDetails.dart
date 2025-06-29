import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Ui/HomeScreen/tabs/QuranTab/SuraContentDetails.dart';
import 'package:islami/Utils/AppAssets.dart';
import 'package:islami/Utils/AppColors.dart';
import 'package:islami/Utils/AppStyles.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/MostRecentProviders.dart';
import '../../../../Utils/QuranContent.dart';

class QuranDetails extends StatefulWidget {
  static const routeName = 'QuranDetails';

  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  int selectedIndex = 0;
  List<String> verses = [];
  late MostRecentProviders provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MostRecentProviders>(context);
    int args = ModalRoute.of(context)?.settings.arguments as int;

    // Load the sura file only once
    if (verses.isEmpty) {
      loadeSuraFile(args);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.Black,
        centerTitle: true,
        title: Text(
          QuranContent.englishQuranSurahs[args],
          style: AppStyles.bold24gold,
        ),
      ),
      body: Container(
        color: AppColors.Black,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(AppAssets.LeftShape),
                Text(
                  QuranContent.arabicAuranSuras[args],
                  style: AppStyles.bold24gold,
                ),
                Image.asset(AppAssets.rightShape),
              ],
            ),
            Expanded(
              child: verses.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        itemCount: verses.length,
                        itemBuilder: (context, index) {
                          return SuraContent(
                            index: index,
                            aya: verses[index],
                            selectAya: () => selectAya(index),
                            selectedindex: selectedIndex,
                          );
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: AppColors.gold,
                      ),
                    ),
            ),
            Image.asset(AppAssets.BotomShape),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    provider.readMostResentList();
    super.dispose();
  }

  void selectAya(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void loadeSuraFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/QuranFiles/${index + 1}.txt');
    List<String> suraLines = fileContent.split('\n');
    verses = suraLines;
    setState(() {});
  }
}