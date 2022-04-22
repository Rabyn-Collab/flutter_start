
import 'package:flutter/material.dart';



class HomeScreenPrev extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  PreferredSize(
          preferredSize: Size(
              double.infinity,
              50
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppBar(
              // backgroundColor: Colors.black.withOpacity(0.7),
              // backgroundColor: Colors.pink,
              // backgroundColor: Color(0xFFF2F5F9),
              // backgroundColor: Color.fromRGBO(2, 90, 50, 0.5),
              // leading: Icon(Icons.book),
              // centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text('Hi John, ', style: TextStyle(color: Colors.black),),
              actions: [
                //   Icon(CupertinoIcons.book),
                Icon(Icons.search, color: Colors.black, size: 30,),
                SizedBox(width: 10,),
                Icon(Icons.notification_important_outlined, color: Colors.black, size: 30,),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
          ),
          height: 500,
          width: double.infinity,
          child:  Row(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                width: 100,
                color: Colors.pink,
              ),
              SizedBox(width: 10,),
              Container(
                height: 70,
                width: 100,
                color: Colors.purple,
              ),
              SizedBox(width: 10,),
              Container(
                height: 70,
                width: 100,
                color: Colors.amber,
              ),


            ],
          ),

          // Column(
          //   //crossAxisAlignment: CrossAxisAlignment.end,
          //  // mainAxisAlignment: MainAxisAlignment.end,
          //  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       height: 70,
          //       width: 150,
          //       color: Colors.pink,
          //     ),
          //     SizedBox(height: 10,),
          //     Container(
          //       height: 70,
          //       width: 150,
          //       color: Colors.purple,
          //     ),
          //     SizedBox(height: 10,),
          //     Container(
          //       height: 70,
          //       width: 150,
          //       color: Colors.amber,
          //     ),
          //
          //
          //   ],
          // ),
        )
    );
  }
}
