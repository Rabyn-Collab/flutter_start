import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects_start/provider/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';


class TabBarWidget extends StatelessWidget {
  final String query;
  TabBarWidget(this.query);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final newsData = ref.watch(newsProvider(query));
        return newsData.when(
            data: (data){
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index){
                  final dat = data[index];
                 final formatter = DateFormat('yyyy-MM-dd');
                 final date = DateTime.now();
                  DateTime dt = DateTime.parse(dat.published_date);
              //   final d =  DateFormat.yMEd().add_jms().format(dt);

                    return Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      width: 350,
                      height: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              errorWidget: (ctx, d ,string) => Image.asset('assets/noimg.jpg'),
                             imageUrl: dat.media,
                              width: 350,
                              height: 190,
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 5,),
                          Container(
                              width: 350,
                              child: Text(dat.title ,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,)),
                          SizedBox(height: 15,),
                          Text(formatter.format(dt)),
                        ],
                      ),
                    );
                  }
              );
            },
            error: (err, stack) => Text('$err'),
            loading: () => Center(child: CircularProgressIndicator())
        );
      }
    );
  }
}
