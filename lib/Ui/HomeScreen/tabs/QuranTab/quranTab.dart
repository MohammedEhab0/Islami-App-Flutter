import 'package:flutter/material.dart';
import 'package:islami/Ui/HomeScreen/tabs/QuranTab/QuranDetails.dart';
import 'package:islami/Utils/AppAssets.dart';
import 'package:islami/Utils/AppColors.dart';
import 'package:islami/Utils/AppStyles.dart';
import 'package:islami/Utils/QuranContent.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * .0465),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(),
          Padding(
              padding: EdgeInsets.symmetric(vertical: height * .01),
              child: TextField(
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
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                QuranContent.englishQuranSurahs[index],
                                style: AppStyles.bold20black,
                              ),
                              Text(
                                QuranContent.arabicAuranSuras[index],
                                style: AppStyles.bold20black,
                              ),
                              Text(
                                QuranContent.AyaNumber[index] + ' Verses',
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
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(width: width * .02),
                itemCount: QuranContent.arabicAuranSuras.length),
          ),
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
                      Navigator.of(context)
                          .pushNamed(QuranDetails.routeName, arguments: index);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(AppAssets.ayaIcon),
                              Text('${index + 1}', style: AppStyles.bold16White)
                            ],
                          ),
                          SizedBox(width: width * .08),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                QuranContent.englishQuranSurahs[index],
                                style: AppStyles.bold20White,
                              ),
                              SizedBox(height: height * .01),
                              Text(
                                QuranContent.AyaNumber[index] + ' Verses',
                                style: AppStyles.bold16White,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            QuranContent.arabicAuranSuras[index],
                            style: AppStyles.bold20White,
                          )
                        ],
                      ),
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
                itemCount: QuranContent.arabicAuranSuras.length),
          ),
        ],
      ),
    );
  }
}
