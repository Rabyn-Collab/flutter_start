import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects_start/model/movie.dart';
import 'package:flutter_projects_start/provider/movie_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class MovieDetail extends StatelessWidget {
  final Movie movie;
  MovieDetail(this.movie);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Consumer(
                  builder: (context, ref, child) {
                    final movieData = ref.watch(videoProvider(movie.id));
                    return  movieData.when(
                        data: (data){
                          return YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: data,
                              flags: YoutubePlayerFlags(
                                autoPlay: false
                              ),
                            ),
                            showVideoProgressIndicator: true,
                          );
                        },
                        error: (err, stack) => Text('$err'),
                        loading: () => Container()
                    );
                  }
    ),
            ),
            Column(
              children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/' + movie.poster_path,
                    fit: BoxFit.fill,
                    errorWidget: (ctx, obj, stack){
                      return Image.asset('assets/noimg.jpg');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 300,
                          child: Text(movie.title, style: TextStyle(fontSize: 20),maxLines: 2,)),
                      Text(movie.release_date)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(movie.overview),
                )

              ],
            )



          ],
        )
    );
  }
}
