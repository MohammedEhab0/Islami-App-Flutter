import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Ui/HomeScreen/tabs/RadioTab/Cubit/RadioTapStates.dart';
import 'package:islami/Ui/HomeScreen/tabs/RadioTab/RadioItem.dart';
import 'package:islami/Utils/AppColors.dart';

import '../../../../../Utils/AppStyles.dart';
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
                  onClick: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    viewModel.fetchReciters();
                  },
                ),
              ),
              SizedBox(width: width * .05),
              Expanded(
                child: radioButton(
                  index: 1,
                  buttonName: 'Reciters',
                  onClick: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                    viewModel.fetchReciters();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<RadioTabViewModel, RadioTabState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is RadioTabLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RadioTabErrorState) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'حدث خطأ أثناء تحميل القراء.\nيرجى المحاولة لاحقًا.',
                        style: AppStyles.bold16White,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                } else if (state is RadioTabSuccessState) {
                  return RadioItem(
                    itemCount: state.reciters.length,
                    radioList: state.reciters,
                  );
                } else {
                  return const Center(child: Text("Something went wrong."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget radioButton({
    required int index,
    required String buttonName,
    required VoidCallback onClick,
  }) {
    final isSelected = selectedIndex == index;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? AppColors.Black : AppColors.gold,
        foregroundColor: isSelected ? AppColors.White : AppColors.Black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onClick,
      child: Text(buttonName),
    );
  }
}
