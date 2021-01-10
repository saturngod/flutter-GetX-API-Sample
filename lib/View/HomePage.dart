import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedb/Controller/upcomingController.dart';
import 'package:moviedb/View/DetailPage.dart';

class HomePage extends StatelessWidget {
  final UpComingController upcomingController = Get.put(UpComingController());

  Widget build(BuildContext context) {
    upcomingController.fetchUpComing();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("MovieDB"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: Obx(() {
            if (upcomingController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return GridView.count(
                  crossAxisCount: 2,
                  children:
                      List.generate(upcomingController.movies.length, (index) {
                    return Center(
                        child: GestureDetector(
                            onTap: () {
                              Get.to(
                                  DetailPage(upcomingController.movies[index]));
                            },
                            child: Column(
                              children: [
                                Image.network(
                                    "https://image.tmdb.org/t/p/w185_and_h278_bestv2/" +
                                        upcomingController
                                            .movies[index].posterPath,
                                    height: 150),
                                Text(upcomingController.movies[index].title)
                              ],
                            )));
                  }));
            }
          }))
        ],
      ),
    );
  }
}
