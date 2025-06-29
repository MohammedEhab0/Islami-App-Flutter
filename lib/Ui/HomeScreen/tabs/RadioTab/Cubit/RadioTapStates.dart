import '../../../../../model/reciters.dart';

abstract class RadioTabState {}

class RadioTabLoadingState extends RadioTabState {}

class RadioTabErrorState extends RadioTabState {
  String error;

  RadioTabErrorState({required this.error});
}

class RadioTabSuccessState extends RadioTabState {
  final List<Reciter> reciters;

  RadioTabSuccessState({required this.reciters});
}
