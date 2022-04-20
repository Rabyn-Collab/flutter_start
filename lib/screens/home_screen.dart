import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects_start/models/book.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xFF8E3200),
        // backgroundColor: Color.fromRGBO(20, 12, 45, 0.5),
        // backgroundColor: Colors.pink.withOpacity(0.9),
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBar(
              // titleTextStyle: TextStyle(color:Colors.black),
              // actionsIconTheme: IconThemeData.fallback(),
              elevation: 0,
              title: Text('Hi John,', style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.white,
              actions: [
                Icon(Icons.search, color: Colors.black, size: 30,),
                Icon(CupertinoIcons.today, color: Colors.black, size: 30,),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Image.network(
                  'https://images.unsplash.com/photo-1588580000645-4562a6d2c839?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                SizedBox(height: 20,),
              Container(
                height: 220,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                    itemBuilder: (context, index){
                    final book = books[index];
                       return Container(
                         width: 350,
                         margin: EdgeInsets.only(right: 10),
                         child: Row(
                           children: [
                             Image.network(book.bookImageUrl, width: 120, height: 220,fit: BoxFit.cover,),
                            SizedBox(width: 10,),
                             Expanded(
                               child: Card(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children: [
                                     Text(book.title),
                                     Container(
                                         width: 160,
                                         child: Text(book.overview, maxLines: 5, overflow: TextOverflow.ellipsis,)),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text(book.star),
                                         Text(book.genre),
                                       ],
                                     )
                                   ],
                                 ),
                               ),
                             )
                           ],
                         ),
                       );
                    }
                ),
              )
            ],
          ),
        )
    );
  }
}

