import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Providers/MostRecentProviders.dart';
import 'package:provider/provider.dart';

import 'Ui/HomeScreen/HomeScreen.dart';
import 'Ui/HomeScreen/tabs/QuranTab/QuranDetails.dart';
import 'Ui/Introdaction/Intro.dart';
import 'Utils/AppTheme.dart';
import 'Utils/my_BlocObserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => MostRecentProviders(),
      // Return the instance
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Islami App',
        darkTheme: AppTheme.darkTheme,
        initialRoute: Intro.routeName,
        themeMode: ThemeMode.dark,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          Intro.routeName: (context) => const Intro(),
          QuranDetails.routeName: (context) => QuranDetails(),
        });
  }
}
