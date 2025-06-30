import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/Ui/HomeScreen/tabs/TimeTab/AzkarItem.dart';

class Azkarlist extends StatefulWidget {
  static const routeName = 'Azkarlist';

  const Azkarlist({super.key});

  @override
  State<Azkarlist> createState() => _AzkarlistState();
}

class _AzkarlistState extends State<Azkarlist> {
  List<Map<String, dynamic>> azkarItems = [];
  bool isLoading = true;
  late String category;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    category = ModalRoute.of(context)?.settings.arguments as String;
    loadAzkar();
  }

  Future<void> loadAzkar() async {
    final jsonStr = await DefaultAssetBundle.of(context)
        .loadString('assets/azkar/azkar.json');
    final jsonData = json.decode(jsonStr) as Map<String, dynamic>;

    final List<dynamic> rawList = jsonData[category] ?? [];

    azkarItems = rawList.map<Map<String, dynamic>>((item) {
      if (item is Map) {
        return item.map((key, value) => MapEntry(key.toString(), value));
      }
      return {};
    }).toList();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return CarouselSlider(
      options: CarouselOptions(
        enlargeFactor: .1,
        viewportFraction: .83,
        enlargeCenterPage: true,
        height: height * .7,
      ),
      items: List.generate(azkarItems.length, (i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: AzkarItem(index: i, category: category),
            );
          },
        );
      }),
    );
  }
}
