import 'package:flutter/material.dart';
import 'package:islami/Providers/MostRecentProviders.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/AppAssets.dart';
import '../../../../Utils/AppColors.dart';
import '../../../../Utils/AppStyles.dart';
import '../../../../Utils/QuranContent.dart';
import 'QuranDetails.dart';

class MostRecent extends StatefulWidget {
  const MostRecent({super.key});

  @override
  State<MostRecent> createState() => _MostRecentState();
}

class _MostRecentState extends State<MostRecent> {
  late MostRecentProviders provider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.readMostResentList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    provider = Provider.of<MostRecentProviders>(context);
    return Visibility(
        visible: provider.mostRecentList.isNotEmpty,
        child: Column(
          children: [
            SizedBox(height: height * .01),
            Text(
              'Must recsnt',
              style: AppStyles.bold16White,
            ),
            SizedBox(height: height * .01),
            Container(
              height: height * .17,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(QuranDetails.routeName,
                            arguments: provider.mostRecentList[index]);
                        provider.updateMostResentList(
                            provider.mostRecentList[index]);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        width: width * .70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.gold,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    QuranContent.englishQuranSurahs[
                                        provider.mostRecentList[index]],
                                    style: AppStyles.bold20black,
                                  ),
                                  Text(
                                    QuranContent.arabicAuranSuras[
                                        provider.mostRecentList[index]],
                                    style: AppStyles.bold20black,
                                  ),
                                  Text(
                                    '${QuranContent.AyaNumber[index]} Verses',
                                    style: AppStyles.bold16black,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              AppAssets.mus7af,
                              fit: BoxFit.fitWidth,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(width: width * .02),
                  itemCount: provider.mostRecentList.length),
            ),
          ],
        ));
  }
}
