import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final top = MediaQuery.of(context).padding.top;

    final actualHeight = h - top - 50;
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size(
          double.infinity,
          50
        ),
        child: AppBar(
         // backgroundColor: Colors.black.withOpacity(0.7),
          backgroundColor: Colors.pink,
        // backgroundColor: Color(0xFFF2F5F9),
         // backgroundColor: Color.fromRGBO(2, 90, 50, 0.5),
         // leading: Icon(Icons.book),
         // centerTitle: true,
          elevation: 0,
        //  backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('Hi John, ', style: TextStyle(color: Colors.black),),
          ),
          actions: [
         //   Icon(CupertinoIcons.book),
              Icon(Icons.search, color: Colors.black, size: 30,),
              SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 10), 
                child: Icon(Icons.notification_important_outlined, color: Colors.black, size: 30,),
              ),
          ],
        ),
      ),
        body:  SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.pink,
              )),
              Expanded(
                  flex: 2,
                  child: Container(
                color: Colors.black,
              )),
              Expanded(child: Container(
                color: Colors.blueGrey,
              ))
            ],
          )
        )
    );
  }
}
