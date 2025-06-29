import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/api_EndPoint/ApiEndPoint.dart';
import '../../../../../api/api_const/ApiConst.dart';
import '../../../../../api/api_mengar/ApiMengar.dart';
import '../../../../../model/radios.dart';
import '../../../../../model/reciters.dart';
import 'RadioTapStates.dart';

class RadioTabViewModel extends Cubit<RadioTabState> {
  RadioTabViewModel() : super(ReciterTabLoadingState());

  final apimanger = ApiManger();

  Future<Reciter?> fetchReciters() async {
    emit(ReciterTabLoadingState());

    try {
      final response = await apimanger.getData(
        queryParameters: {"language": "ar"},
        baseUrl: ApiConst.Mp3Quran,
        endPoint: EndPoints.reciters,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final recitersResponse = RecitersResponse.fromJson(response.data);
        final reciters = recitersResponse.reciters ?? [];

        emit(ReciterTabSuccessState(reciters: reciters));
      } else {
        final errorMsg = response.statusMessage ?? 'Unknown error';
        debugPrint('[RadioTabViewModel] API Error: $errorMsg');
        emit(ReciterTabErrorState(error: errorMsg));
      }
    } catch (e, stack) {
      debugPrint('[RadioTabViewModel] Exception: $e');
      debugPrintStack(stackTrace: stack);
      emit(ReciterTabErrorState(error: 'Connection error: ${e.toString()}'));
    }

    return null;
  }

  Future<Reciter?> fetchRadio() async {
    emit(RadioTabLoadingState());

    try {
      final response = await apimanger.getData(
        queryParameters: {"language": "ar"},
        baseUrl: ApiConst.Mp3Quran,
        endPoint: EndPoints.radios,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final radiosResponse = RadiosList.fromJson(response.data);
        final radiosList = radiosResponse;

        emit(RadioTabSuccessState(radios: radiosList.radios!));
      } else {
        final errorMsg = response.statusMessage ?? 'Unknown error';
        debugPrint('[RadioTabViewModel] API Error: $errorMsg');
        emit(RadioTabErrorState(error: errorMsg));
      }
    } catch (e, stack) {
      debugPrint('[RadioTabViewModel] Exception: $e');
      debugPrintStack(stackTrace: stack);
      emit(RadioTabErrorState(error: 'Connection error: ${e.toString()}'));
    }

    return null;
  }
}
