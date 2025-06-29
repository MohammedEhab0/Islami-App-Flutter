import 'package:shared_preferences/shared_preferences.dart';

class PrefsKeys {
  static const String MostResentKey = 'MostRecent';
}

void UpdateMostResentList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> MostResentIndciesList =
      prefs.getStringList(PrefsKeys.MostResentKey) ?? [];
  if (MostResentIndciesList.contains('$newSuraIndex')) {
    MostResentIndciesList.remove('$newSuraIndex');
    MostResentIndciesList.insert(0, '$newSuraIndex');
  } else {
    MostResentIndciesList.insert(0, '$newSuraIndex');
  }
  if (MostResentIndciesList.length > 5) {
    MostResentIndciesList.removeLast();
  }
  prefs.setStringList(PrefsKeys.MostResentKey, MostResentIndciesList);
}

Future<List<int>> ReadMostResentList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> MostResentIndciesString =
      prefs.getStringList(PrefsKeys.MostResentKey) ?? [];
  List<int> MostResentIndciesInt =
      MostResentIndciesString.map((element) => int.parse(element)).toList();
  return MostResentIndciesInt;
}
