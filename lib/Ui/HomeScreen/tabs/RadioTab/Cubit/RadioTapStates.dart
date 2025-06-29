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

class ReciterTabErrorState extends RadioTabState {
  String error;

  ReciterTabErrorState({required this.error});
}

class ReciterTabSuccessState extends RadioTabState {
  final List<Reciter> reciters;

  ReciterTabSuccessState({required this.reciters});
}

class ReciterTabLoadingState extends RadioTabState {}