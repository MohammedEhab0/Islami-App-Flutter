
import 'package:flutter/material.dart';

import 'Ui/HomeScreen/HomeScreen.dart';
import 'Ui/HomeScreen/tabs/QuranTab/QuranDetails.dart';
import 'Ui/Introdaction/Intro.dart';
import 'Utils/AppTheme.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Islami App',
        darkTheme: AppTheme.darkTheme,
        initialRoute: Intro.routeName,themeMode:ThemeMode.dark ,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          Intro.routeName: (context) => const Intro(),
          QuranDetails.routeName: (context) => QuranDetails(),
        });
  }
}



