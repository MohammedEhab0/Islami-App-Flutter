import 'package:flutter/material.dart';
import 'package:islami/Utils/AppStyles.dart';

import '../../../../Utils/AppAssets.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;

  List<String> tsabeh = [
    'سُبْحَانَ الْلَّهِ',
    'لَا إِلَهَ إِلَّا اللَّهُ',
    'الْحَمْدُ لِلَّهِ',
    'الْلَّهُ أَكْبَرُ',
    'أستغفر الله',
    'لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ',
    'سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِِ',
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِِ'
  ];

  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          style: AppStyles.bold32White,
          textAlign: TextAlign.center,
        ),
        Container(
          child: Image.asset(AppAssets.sebhaEnd),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedRotation(
                turns: turns,
                duration: const Duration(seconds: 1),
                child: Container(
                  child: Image.asset(
                    AppAssets.sebhaBody,
                    width: width * .9,
                  ),
                )),
            InkWell(
              onTap: () {
                addCounter();
                setState(() {
                  turns += 0.025;
                  changeTsabeh();
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    tsabeh[index],
                    style: AppStyles.bold32White,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '$counter',
                    style: AppStyles.bold32White,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void changeTsabeh() {
    if (counter == 33) {
      counter = 0;
      index = (index + 1) % tsabeh.length;
    }
  }

  void addCounter() {
    if (counter < 33) {
      counter++;
    }
  }
}
