import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/Utils/AppAssets.dart';
import 'package:islami/Utils/AppColors.dart';
import 'dart:ui' as ui;

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * .0465),
      child: Column(
        children: [
          Row(),
          TextField(
            cursorColor: AppColors.gold,
            decoration: InputDecoration(
                hintText: 'Sura Name',
                hintStyle: GoogleFonts.elMessiri(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.White),
                prefixIcon: ImageIcon(
                  AssetImage(
                    AppAssets.quranIcon,
                  ),
                  color: AppColors.gold,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.gold, width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.gold, width: 2))),
          )
        ],
      ),
    );
  }
}
