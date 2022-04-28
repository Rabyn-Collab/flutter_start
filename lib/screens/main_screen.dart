import 'package:flutter/material.dart';
import 'package:flutter_projects_start/provider/news_provider.dart';
import 'package:flutter_projects_start/widgets/tab_bar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            ],
          ),
        ));
  }
}
