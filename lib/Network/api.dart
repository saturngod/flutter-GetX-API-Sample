import 'package:http/http.dart' as http;
import 'package:moviedb/model/upcoming.dart';
import 'package:moviedb/model/casts.dart';

class MovieDBAPI {
  static var client = http.Client();
  static var apiKey = "a92f28e11a27e8e5938a2020be68ba9c";

  static Future<List<Movie>> fetchUpComingMovies() async {
    var response = await client
        .get('https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey');
    if (response.statusCode == 200) {
      var json = response.body;
      var upcoming = upcomingFromJson(json);
      return upcoming.results;
    } else {
      return null;
    }
  }

  static Future<List<Cast>> fetchCastOfMovie({int movieID}) async {
    var response = await client.get(
        'https://api.themoviedb.org/3/movie/$movieID/credits?api_key=a92f28e11a27e8e5938a2020be68ba9c');
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = castsFromJson(json);
      return castsResp.cast;
    } else {
      return null;
    }
  }
}
