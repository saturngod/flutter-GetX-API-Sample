import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:moviedb/Controller/castsController.dart';

class CastList extends StatelessWidget {
  int movieID;

  CastList(this.movieID);

  final CastController castController = Get.put(CastController());

  @override
  Widget build(BuildContext context) {
    castController.fetchCasts(movieID: this.movieID);

    return SizedBox(
        height: 220,
        child: Obx(() {
          if (castController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return GridView.count(
              childAspectRatio: 2,
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              children: List.generate(castController.casts.length, (index) {
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Image.network(
                          "https://image.tmdb.org/t/p/w185_and_h278_bestv2${castController.casts[index].profilePath}",
                          height: 150),
                      Text(castController.casts[index].name)
                    ],
                  ),
                );
              }),
            );
          }
        }));
  }
}
