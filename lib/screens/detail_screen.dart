import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects_start/models/book.dart';



class DetailScreen extends StatelessWidget {

  final Book book;

  DetailScreen(this.book);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
         Container(
             height: 400,
             width: double.infinity,
             child: Image.network(book.imageUrl, fit: BoxFit.fill,)),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(book.title),
                      Column(
                        children: [
                          Text(book.star),
                          Text(book.genre),
                        ],
                      )
                    ],
                  ),

                  Text(book.overview, style: TextStyle(fontFamily: 'WaterBrush'),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          minimumSize: Size(150, 60),
                          primary: Color(0xFF007084),
                        ),
                          onPressed: (){

                          },
                          child: Text('Read Book')
                      ),
                      SizedBox(width: 20,),
                      OutlinedButton(
                          onPressed: (){

                          }, child: Text('More Info'))
                    ],
                  )


                ],
              ),
            )

          ],
        )
    );
  }
}




