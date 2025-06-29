import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Ui/HomeScreen/tabs/RadioTab/Cubit/RadioTapStates.dart';
import 'package:islami/Ui/HomeScreen/tabs/RadioTab/RadioItem.dart';
import 'package:islami/Utils/AppColors.dart';

import '../../../../../Utils/AppStyles.dart';
import '../../../../../model/reciters.dart';
import 'RadioTabViewModel.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;
  final RadioTabViewModel viewModel = RadioTabViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchReciters();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * .04),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: radioButton(
                      index: 0,
                      buttonName: 'Radio',
                      onClick: viewModel.fetchReciters())),
              SizedBox(width: width * .05),
              Expanded(
                child: radioButton(
                    index: 1,
                    buttonName: 'Reciters',
                    onClick: viewModel.fetchReciters()),
              ),
            ],
          ),
          BlocBuilder<RadioTabViewModel, RadioTabState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is RadioTabLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RadioTabErrorState) {
                  return Center(
                    child: Text(state.error, style: AppStyles.bold16White),
                  );
                } else if (state is RadioTabSuccessState) {
                  Expanded(
                      child: RadioItem(
                          itemCount: state.reciters.length,
                          radioList: state.reciters));
                }
                return Center(child: Text("Something went wrong."));
              })
        ],
      ),
    );
  }

  ElevatedButton radioButton(
      {required int index,
      required String buttonName,
      required Future<Reciter?> onClick}) {
    return selectedIndex == index
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.Black,
              foregroundColor: AppColors.White,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              selectedIndex = index;
              onClick;
              setState(() {});
            },
            child: Text(buttonName),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.Black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              selectedIndex = index;
              onClick;
              setState(() {});
            },
            child: Text(buttonName),
          );
  }
}
