import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_projects_start/api.dart';
import 'package:flutter_projects_start/model/movie_initState.dart';
import 'package:flutter_projects_start/provider/movie_provider.dart';
import 'package:flutter_projects_start/widgets/movie_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MainScreen extends StatelessWidget {
  final node = FocusNode();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          flexibleSpace: Image.asset(
            'assets/tmdbhelp.jpg',
            fit: BoxFit.cover,
          ),
        ),
        body: OfflineBuilder(
            child: Container(),
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              return KeyboardDismisser(
                gestures: [
                  GestureType.onTap,
                  GestureType.onPanUpdateDownDirection,
                ],
                child: Consumer(builder: (context, ref, child) {
                  final movieData = ref.watch(movieProvider);
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              controller: searchController,
                              onFieldSubmitted: (val) {
                                ref
                                    .read(movieProvider.notifier)
                                    .searchMovies(val);
                                searchController.clear();
                              },
                              focusNode: FocusNode(canRequestFocus: false),
                              decoration: InputDecoration(
                                hintText: 'search for movies',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(),
                              ),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            PopupMenuButton(
                                onSelected: (val) {
                                  ref
                                      .read(movieProvider.notifier)
                                      .changeCategory(val as String);
                                },
                                icon: Icon(
                                  Icons.menu,
                                  size: 39,
                                ),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      child: Text('Popular'),
                                      value: Api.getPopular,
                                    ),
                                    PopupMenuItem(
                                      child: Text('Top_rated'),
                                      value: Api.getTopRated,
                                    ),
                                    PopupMenuItem(
                                      child: Text('Upcoming'),
                                      value: Api.getUpcoming,
                                    )
                                  ];
                                })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    if(movieData.apiPath == Api.getPopular)  _buildExpanded(movieData, ref, connected),
                    if(movieData.apiPath != Api.getPopular) connected ?  _buildExpanded(movieData, ref, connected) : Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 150,),
                            Icon(Icons.wifi_off_outlined, size: 50,),
                             Text('no connection try again')
                          ],
                        ),
                      ),
                    ),
                    ],
                  );
                }),
              );
            }));
  }

  Expanded _buildExpanded(MovieState movieData, WidgetRef ref, bool connected) {
    return Expanded(
      child: movieData.movies.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            )
          : movieData.movies[0].title == 'no title'
              ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Try using another key word',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ref.refresh(movieProvider.notifier);
                          },
                          child: Text('Reload'))
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: NotificationListener(
                    onNotification: (onNotification) {
                      if (onNotification is ScrollEndNotification) {
                        final before = onNotification.metrics.extentBefore;
                        final max = onNotification.metrics.maxScrollExtent;
                        if (before == max) {
                        if(connected){
                          ref.read(movieProvider.notifier).loadMore();
                        }
                        }
                      }
                      return true;
                    },

                    child: GridView.builder(
                        itemCount: movieData.movies.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio: 2 / 3),
                        itemBuilder: (context, index) {
                          final movie = movieData.movies[index];
                          return InkWell(
                            onTap: () {
                              Get.to(() => MovieDetail(movie),
                                  transition: Transition.leftToRight);
                            },
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/w600_and_h900_bestv2/' +
                                          movie.poster_path,
                                  errorWidget: (ctx, obj, stack) {
                                    return Image.asset('assets/noimg.jpg');
                                  },
                                )),
                          );
                        }),
                  ),
                ),
    );
  }
}
