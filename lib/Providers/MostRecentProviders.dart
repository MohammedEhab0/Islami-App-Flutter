import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/SharedPreferences.dart';

class MostRecentProviders extends ChangeNotifier {
  List<int> mostRecentList = [];

  void updateMostResentList(int newSuraIndex) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> MostResentIndciesList =
        prefs.getStringList(PrefsKeys.MostResentKey) ?? [];
    if (MostResentIndciesList.contains('${newSuraIndex}')) {
      MostResentIndciesList.remove('${newSuraIndex}');
      MostResentIndciesList.insert(0, '${newSuraIndex}');
    } else {
      MostResentIndciesList.insert(0, '${newSuraIndex}');
    }
    if (MostResentIndciesList.length > 5) {
      MostResentIndciesList.removeLast();
    }
    prefs.setStringList(PrefsKeys.MostResentKey, MostResentIndciesList);
  }

  readMostResentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> MostResentIndciesString =
        prefs.getStringList(PrefsKeys.MostResentKey) ?? [];
    mostRecentList =
        MostResentIndciesString.map((element) => int.parse(element)).toList();
    notifyListeners();
  }
}
