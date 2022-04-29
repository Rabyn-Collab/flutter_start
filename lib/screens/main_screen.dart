import 'package:flutter/material.dart';
import 'package:flutter_projects_start/provider/news_provider.dart';
import 'package:flutter_projects_start/widgets/tab_bar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
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
                          decoration: InputDecoration(
                            hintText: 'Search news',
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            border: OutlineInputBorder()
                          ),),
                      ),
                    SizedBox(height: 10,),
                    newsData.isEmpty ? Container(
                      child: Text('Loading....'),
                    ) : Container(
                      height: 400,
                      child: ListView.builder(
                            itemCount: newsData.length,
                            itemBuilder: (context, index){
                              final dat = newsData[index];
                              final formatter = DateFormat('yyyy-MM-dd');
                              final date = DateTime.now();
                              DateTime dt = DateTime.parse(dat.published_date);
                              //   final d =  DateFormat.yMEd().add_jms().format(dt);

                              return Container(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                margin: EdgeInsets.only(bottom: 5),
                                width: 350,
                                height: 270,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(dat.media,
                                        width: 170,
                                        height: 270,
                                        fit: BoxFit.cover,),
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
