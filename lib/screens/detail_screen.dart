import 'package:flutter/material.dart';

import '../models/book.dart';




class DetailScreen extends StatelessWidget {
  final Book book;
  DetailScreen(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  ListView(
          children: [
            Container(
                height: 300,
                child: Image.network(book.bookImageUrl, fit: BoxFit.fill,)),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(book.title),
                      Spacer(),
                      Column(
                        children: [
                          Text(book.star),
                          SizedBox(height: 10,),
                          Text(book.genre)
                        ],
                      )
                    ],
                  ),
                  Text(book.overview),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          minimumSize: Size(150, 50),
                          primary: Color(0xFF007084)
                        ),
                        onPressed: (){}, child: Text('Read Book')),
                       SizedBox(width: 40,),
                      OutlinedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              minimumSize: Size(150, 50),

                          ),
                          onPressed: (){

                          }, child: Text('More Info'))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
