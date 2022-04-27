import 'package:flutter/material.dart';
import 'package:flutter_projects_start/provider/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child:  Consumer(
        builder: (context, ref, child) {
          final newsData = ref.watch(newsProvider);
          return  newsData.when(
              data: (data){
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index){
                      return Text(data[index].summary);
                    }
                );
              },
              error: (err, stack) => Center(child: Text('$err')),
              loading: (){
                return Center(child: CircularProgressIndicator(),);
              }
          );
        }
      )
    ));
  }


}
