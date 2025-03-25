import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Ui/HomeScreen/tabs/QuranTab/SuraContentDetails.dart';
import 'package:islami/Utils/AppAssets.dart';
import 'package:islami/Utils/AppColors.dart';
import 'package:islami/Utils/AppStyles.dart';

import '../../../../Utils/QuranContent.dart';

class QuranDetails extends StatefulWidget {
  static const routeName = 'QuranDetails';

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context)?.settings.arguments as int;
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
                              itemBuilder: (context, index) {
                                return SuraContent(
                                  index: index,
                                  aya: verses[index],
                                );
                              },
                              itemCount: verses.length),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                          color: AppColors.gold,
                        ))),
              Image.asset(AppAssets.BotomShape),
            ],
          )),
    );
  }

  void loadeSuraFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/Files/${index + 1}.txt');
    List<String> suraLines = fileContent.split('\n');
    verses = suraLines;
    setState(() {});
  }
}
