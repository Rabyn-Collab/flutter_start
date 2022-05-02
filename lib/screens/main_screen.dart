import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects_start/provider/news_provider.dart';
import 'package:flutter_projects_start/widgets/tab_bar_widget.dart';
import 'package:flutter_projects_start/widgets/web_view-widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatelessWidget {

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            // title: Text('News', style: TextStyle(color: Colors.black),),
            // flexibleSpace: Image.network('https://images.hindustantimes.com/img/2022/04/27/550x309/WhatsApp_Image_2021-09-18_at_09.42.18_1631944439782_1651018480535.jpeg'),
            toolbarHeight: 20,
            backgroundColor: Colors.white,
            bottom: TabBar(
                padding: EdgeInsets.only(top: 20),
                labelStyle: TextStyle(fontSize: 17),
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                indicatorColor: Colors.red,
                tabs: [
                  Tab(
                    text: 'Hollywood',
                  ),
                  Tab(
                    text: 'Gaming',
                  ),
                ]),
          ),
          body: Column(
            children: [
              Container(
                height: 290,
                child: TabBarView(
                    children: [
                  TabBarWidget('hollywood'),
                  TabBarWidget('gaming'),
                ]),
              ),
              SizedBox(height: 5,),
              Consumer(
                builder: (context, ref, child){
                  final newsData = ref.watch(searchProvider);
                  return Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: searchController,
                        onFieldSubmitted: (val){
                            ref.read(searchProvider.notifier).searchNews(val);
                            searchController.clear();
                        },
                          decoration: InputDecoration(
                            hintText: 'Search news',
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            border: OutlineInputBorder()
                          ),),
                      ),
                    SizedBox(height: 10,),
                    newsData.isEmpty ? Container(
                      child: Text('Loading....'),
                    ) : newsData[0].title == 'No matches for your search.' ? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const SizedBox(height: 50,),
                          ElevatedButton(
                              onPressed: (){
                            ref.refresh(searchProvider.notifier);
                          }, child: Text('Reload')
                          ),

                          Text('No matches for your search.'),

                        ],
                      ),
                    ): Container(
                      height: 400,
                      child: ListView.builder(
                            itemCount: newsData.length,
                            itemBuilder: (context, index){
                              final dat = newsData[index];
                              final formatter = DateFormat('yyyy-MM-dd');
                              final date = DateTime.now();
                              DateTime dt = DateTime.parse(dat.published_date);
                              //   final d =  DateFormat.yMEd().add_jms().format(dt);

                              return InkWell(
                                onTap: (){
                                  Get.to(() => WebDetail(dat.link), transition: Transition.leftToRight);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, top: 10),
                                  margin: EdgeInsets.only(bottom: 5),
                                  width: 350,
                                  height: 270,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                            imageUrl:dat.media,
                                          errorWidget: (ctx, d ,string) => Image.asset('assets/noimg.jpg'),
                                          width: 170,
                                          height: 270,
                                          fit: BoxFit.cover,  ),
                                      ),
                                      SizedBox(width: 5,),
                                      Expanded(
                                          child:Column(
                                            children: [
                                              Text(dat.title ,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),),
                                              SizedBox(height: 15,),
                                              Text(dat.summary, maxLines: 9,style: TextStyle(color: Colors.blueGrey),),
                                              SizedBox(height: 15,),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 7),
                                                child: Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Text(formatter.format(dt))),
                                              ),
                                            ],
                                          ) )

                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                    )


                    ],
                  ),
                );
                }
              )

            ],
          ),
        ));
  }
}
