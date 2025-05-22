import 'package:google_place/google_place.dart';

class GooglePlaceService {
  final GooglePlace googlePlace;

  GooglePlaceService(String apiKey) : googlePlace = GooglePlace(apiKey);

  Future<List<AutocompletePrediction>> getAutocomplete(String input) async {
    if (input.isEmpty) return [];
    final result = await googlePlace.autocomplete.get(input);
    return result?.predictions ?? [];
  }
}