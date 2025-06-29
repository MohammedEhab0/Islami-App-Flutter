import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Ui/HomeScreen/tabs/TimeTab/cubit/PrayTimeStates.dart';
import 'package:islami/model/prayTime.dart';

import '../../../../../api/api_EndPoint/ApiEndPoint.dart';
import '../../../../../api/api_const/ApiConst.dart';
import '../../../../../api/api_mengar/ApiMengar.dart';
import '../../../../../model/reciters.dart';

class Pray {
  String prayName;
  String prayClock;

  Pray({required this.prayName, required this.prayClock});
}

class TimeViewModel extends Cubit<PrayTimeState> {
  TimeViewModel() : super(PrayTimeLoadingState());

  final apiManger = ApiManger();

  List<Pray> prayTimeList = [];

  Future<Reciter?> fetchPrayTimes() async {
    emit(PrayTimeLoadingState());

    try {
      final response = await apiManger.getData(
        queryParameters: {"city": "cairo", "country": "egypt"},
        baseUrl: ApiConst.prayTime,
        endPoint: EndPoints.getTimeEndpoint(),
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final timingsResponse = PrayTime.fromJson(response.data);
        final timings = timingsResponse.data!.timings;
        prayTimeList = [
          Pray(prayName: 'Fagr', prayClock: timings!.fajr!),
          Pray(prayName: 'Dhuhr', prayClock: timings!.dhuhr!),
          Pray(prayName: 'Asr', prayClock: timings!.asr!),
          Pray(prayName: 'Maghrib', prayClock: timings!.maghrib!),
          Pray(prayName: 'Isha', prayClock: timings!.isha!)
        ];
        emit(PrayTimeSuccessState(timings: timings!));
      } else {
        final errorMsg = response.statusMessage ?? 'Unknown error';
        debugPrint('[TimeViewModel] API Error: $errorMsg');

        emit(PrayTimeErrorState(error: errorMsg));
      }
    } catch (e, stack) {
      debugPrint('[TimeViewModel] Exception: $e');
      debugPrintStack(stackTrace: stack);
      emit(PrayTimeErrorState(error: 'Connection error: ${e.toString()}'));
    }

    return null;
  }
}
