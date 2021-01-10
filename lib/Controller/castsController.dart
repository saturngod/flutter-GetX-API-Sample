import 'package:get/state_manager.dart';
import 'package:moviedb/Network/api.dart';
import 'package:moviedb/model/casts.dart';

class CastController extends GetxController {
  var isLoading = true.obs;
  var casts = List<Cast>().obs;

  void fetchCasts({int movieID}) async {
    try {
      isLoading(true);
      var res = await MovieDBAPI.fetchCastOfMovie(movieID: movieID);
      if (res != null) {
        casts.assignAll(res);
      }
    } finally {
      isLoading(false);
    }
  }
}
