import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/Utils/AppAssets.dart';

import '../../Utils/AppColors.dart';
import '../HomeScreen/HomeScreen.dart';

class Intro extends StatefulWidget {
  static const routeName = 'intro';
  const Intro({super.key});

  @override
  State<Intro> createState() => _introState();
}

class _introState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: IntroductionScreen(
        globalBackgroundColor: Colors.transparent,
        allowImplicitScrolling: true,
        autoScrollDuration: 4000,
        globalFooter: SizedBox(
          width: double.infinity,
          height: 35,
          child: Text(''),
        ),
        pages: [
          PageViewModel(
            decoration: PageDecoration(
              fullScreen: true,
              contentMargin: EdgeInsets.symmetric(horizontal: 16,vertical: 16), // Add horizontal margin
            ),
            title: '',
            body: '',
            image: SizedBox(
              width: double.infinity, // Ensure the container takes full width
              child: Image.asset(
                AppAssets.intro1,
                fit: BoxFit.fill,
              ),
            ),
          ),
          PageViewModel(
            decoration: PageDecoration(bodyPadding:EdgeInsets.symmetric(horizontal: 16,vertical: 16) ,
              fullScreen: true,
              contentMargin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            ),
            title: '',
            body: '',
            image: SizedBox(
              width: double.infinity,
              child: Image.asset(
                AppAssets.intro2,
                fit: BoxFit.fill,
              ),
            ),
          ),
          PageViewModel(
            decoration: PageDecoration(
              fullScreen: true,
              contentMargin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            ),
            title: '',
            body: '',
            image: SizedBox(
              width: double.infinity,
              child: Image.asset(
                AppAssets.intro3,
                fit: BoxFit.fill,
              ),
            ),
          ),
          PageViewModel(
            decoration: PageDecoration(
              fullScreen: true,
              contentMargin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            ),
            title: '',
            body: '',
            image: SizedBox(
              width: double.infinity,
              child: Image.asset(
                AppAssets.intro4,
                fit: BoxFit.fill,
              ),
            ),
          ),
          PageViewModel(
            decoration: PageDecoration(
              fullScreen: true,
              contentMargin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            ),
            title: '',
            body: '',
            image: SizedBox(
              width: double.infinity,
              child: Image.asset(
                AppAssets.intro5,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
        onDone: () => {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName)
        },
        showNextButton: true,
        nextFlex: 0,
        showBackButton: true,
        back: const Text('Back', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.gold)),
        next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.gold)),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.gold)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        dotsDecorator: const DotsDecorator(
          activeColor: AppColors.gold,
          size: Size(5.0, 10.0),
          color: AppColors.Gray,
          activeSize: Size(15, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}