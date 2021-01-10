import 'package:get/state_manager.dart';
import 'package:moviedb/Network/api.dart';
import 'package:moviedb/model/upcoming.dart';

class UpComingController extends GetxController {
  var isLoading = true.obs;
  var movies = List<Movie>().obs;

  void fetchUpComing() async {
    try {
      isLoading(true);
      var res = await MovieDBAPI.fetchUpComingMovies();
      if (res != null) {
        movies.assignAll(res);
      }
    } finally {
      isLoading(false);
    }
  }
}
