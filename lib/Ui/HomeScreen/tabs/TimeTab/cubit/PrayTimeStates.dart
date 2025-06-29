import '../../../../../model/prayTime.dart';

abstract class PrayTimeState {}

class PrayTimeLoadingState extends PrayTimeState {}

class PrayTimeErrorState extends PrayTimeState {
  String error;

  PrayTimeErrorState({required this.error});
}

class PrayTimeSuccessState extends PrayTimeState {
  final Timings timings;

  PrayTimeSuccessState({required this.timings});
}
