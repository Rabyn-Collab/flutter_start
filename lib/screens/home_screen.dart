import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {

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
        body:  Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Container(
                    height: 250,
                    width: double.infinity,
                    child: Image.network('https://images.unsplash.com/photo-1650369335952-abb47b6a81e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8eGpQUjRobGtCR0F8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60', fit: BoxFit.cover,))
              ],
            ),
          ),
        )
    );
  }
}
