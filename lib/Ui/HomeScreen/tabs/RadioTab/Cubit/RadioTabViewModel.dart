// Use material.dart for TextEditingController
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/api_EndPoint/ApiEndPoint.dart';
import '../../../../../api/api_const/ApiConst.dart';
import '../../../../../api/api_mengar/ApiMengar.dart';
import '../../../../../model/reciters.dart';
import 'RadioTapStates.dart';

class RadioTabViewModel extends Cubit<RadioTabState> {
  RadioTabViewModel() : super(RadioTabLoadingState());
  final apimanger = ApiManger();

  Future<Reciter?> fetchReciters() async {
    emit(RadioTabLoadingState());
    try {
      var response = await apimanger.getData(
        baseUrl: ApiConst.Mp3Quran,
        endPoint: EndPoints.reciters,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final recitersResponse = RecitersResponse.fromJson(response.data);
        emit(RadioTabSuccessState(reciters: recitersResponse.reciters ?? []));
      } else {
        emit(RadioTabErrorState(error: response.statusMessage!));
      }
    } catch (e) {
      emit(RadioTabErrorState(error: 'Connection error: ${e.toString()}'));
    }
    return null;
  }

// Future<Movies?> fetchMovieDetails(int movieId) async {
//   try {
//     final response = await apimanger.getData(
//       baseUrl: ApiConstants.moviesBaseUrl,
//       endPoint: "/movie_details.json",
//       queryParameters: {"movie_id": movieId, "with_cast": "true"},
//     );
//
//     if (response.statusCode == 200 && response.data["status"] == "ok") {
//       final movieJson = response.data["data"]["movie"];
//       final movie = Movies.fromJson(movieJson);
//       print("SUMMARY => ${movie.descriptionFull}");
//       print("RAW JSON => $movieJson");
//       print("SUMMARY => ${movie.descriptionFull}");
//       return movie;
//     } else {
//       emit(MoviesError("Failed to load movie details"));
//       return null;
//     }
//   } catch (e) {
//     emit(MoviesError("Error: ${e.toString()}"));
//     return null;
//   }
}
