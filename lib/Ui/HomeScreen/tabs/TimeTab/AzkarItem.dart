import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Utils/AppColors.dart';
import 'package:islami/Utils/AppStyles.dart';

import '../../../../Utils/AppAssets.dart';

class AzkarItem extends StatefulWidget {
  final int index;
  final String category; // "أذكار الصباح" أو "أذكار المساء"

  const AzkarItem({super.key, required this.index, required this.category});

  @override
  State<AzkarItem> createState() => _AzkarItemState();
}

class _AzkarItemState extends State<AzkarItem> {
  Map<String, dynamic>? azkarData;
  Map<String, dynamic>? azkarItem;

  @override
  void initState() {
    super.initState();
    loadAzkarFromJson(widget.index);
  }

  Future<void> loadAzkarFromJson(int index) async {
    final String jsonString =
        await rootBundle.loadString('assets/azkar/azkar.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    final List<dynamic> azkarList = jsonData[widget.category] ?? [];

    if (index < azkarList.length) {
      final item = azkarList[index];
      if (item is List) {
        // أحياناً العنصر يكون List بداخل List
        azkarItem = item[0];
      } else if (item is Map<String, dynamic>) {
        azkarItem = item;
      }
    }

    setState(() => azkarData = jsonData);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.HadethBackground)),
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: azkarItem == null
          ? Center(child: CircularProgressIndicator(color: AppColors.Black))
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .02,
                    vertical: height * .005,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(AppAssets.cornerrRi, width: width * .15),
                      Expanded(
                        child: Text(
                          azkarItem?['category'] ?? '',
                          style: AppStyles.bold20black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Image.asset(AppAssets.cornerrLeft, width: width * .15),
                    ],
                  ),
                ),
                SizedBox(height: height * .02),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      azkarItem?['content'] ?? '',
                      style: AppStyles.bold16black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                if ((azkarItem?['count'] ?? '') != '')
                  Text(
                    'التكرار: ${azkarItem!['count']}',
                    style: AppStyles.bold16black,
                  ),
                if ((azkarItem?['description'] ?? '').toString().isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      azkarItem!['description'],
                      style:
                          AppStyles.bold16black.copyWith(color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ),
                Image.asset(AppAssets.mosque, fit: BoxFit.fitWidth),
              ],
            ),
    );
  }
}
