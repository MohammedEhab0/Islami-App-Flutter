import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Utils/AppColors.dart';
import 'package:islami/Utils/AppStyles.dart';

import '../../../../Utils/AppAssets.dart';
import 'hadethModel.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethContent(widget.index);
  }

  HadethModel? hadeth;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.HadethBackground)),
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20)),
      child: hadeth == null
          ? Center(
              child: CircularProgressIndicator(
              color: AppColors.Black,
            ))
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * .02, vertical: height * .005),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        AppAssets.cornerrRi,
                        width: width * .15,
                      ),
                      Expanded(
                          child: Text(
                        hadeth?.title ?? '',
                        style: AppStyles.bold20black,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      )),
                      Image.asset(AppAssets.cornerrLeft, width: width * .15)
                    ],
                  ),
                ),
                SizedBox(height: height * .02),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      hadeth?.content ?? '',
                      style: AppStyles.bold16black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Image.asset(
                  AppAssets.mosque,
                  fit: BoxFit.fitWidth,
                )
              ],
            ),
    );
  }

  void loadHadethContent(int index) async {
    String HadethContent =
        await rootBundle.loadString('assets/HadeethFiles/h$index.txt');
    String title = HadethContent.substring(0, HadethContent.indexOf('\n'));
    String content = HadethContent.substring(HadethContent.indexOf('\n') + 1);
    hadeth = HadethModel(content: content, title: title);
    setState(() {});
  }
}
