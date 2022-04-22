import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects_start/models/book.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      // final appBar = AppBar(
      //   title: Text('hello'),
      // );
    final navTop = MediaQuery.of(context).padding.top;
  //  final height = MediaQuery.of(context).size.height - (appBar.preferredSize.height + navTop );
    final height = MediaQuery.of(context).size.height - (50 + navTop );
    print(height);
    return Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xFF8E3200),
        // backgroundColor: Color.fromRGBO(20, 12, 45, 0.5),
        // backgroundColor: Colors.pink.withOpacity(0.9),
        appBar: //appBar,
        PreferredSize(
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: height * 0.25,
                width: double.infinity,
                child: Image.network(
                    'https://images.unsplash.com/photo-1588580000645-4562a6d2c839?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', fit: BoxFit.cover),
              ),
              SizedBox(height: 20,),
              Container(
                height: 210,
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
                            Image.network(book.bookImageUrl, width: 120, height: 210,fit: BoxFit.cover,),
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
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text('You may also like', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ),
              ),

              // Container(
              //   color: Colors.purple,
              //     height: 150,
              //     width: double.infinity,
              //     child: FittedBox(
              //         child: Text('alskdjlsakdjlksajdlka', style: TextStyle(fontSize: 25),)))



              Container(
                height: 269,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: books.length,
                    itemBuilder: (context, index){
                      final book = books[index];
                      return Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                //borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(book.bookImageUrl, width: 150, height: 220,fit: BoxFit.cover,)),
                            SizedBox(height: 10,),
                            Text(book.title),
                            Text(book.genre, style: TextStyle(color: Colors.blueGrey),)

                          ],
                        ),
                      );
                    }
                ),
              ),













            ],
          ),
        )
    );
  }
}