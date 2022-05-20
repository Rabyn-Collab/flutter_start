import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects_start/screens/main_screen.dart';
import 'package:flutter_projects_start/screens/status_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';



void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 SystemChrome.setSystemUIOverlayStyle(
   SystemUiOverlayStyle(statusBarColor: Colors.black)
 );
  runApp(ProviderScope(child: Home()));
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  StatusScreen(),
    );
  }
}

//
//
// class Counter extends StatelessWidget {
//
//     int number = 0;
//
//    StreamController<int>  nController = StreamController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             StreamBuilder<Object>(
//               stream: nController.stream,
//               builder: (context, snapshot) {
//                 // if(snapshot.connectionState == ConnectionState.waiting){
//                 //
//                 // }
//                 if(snapshot.hasData){
//                   return Center(child: Text('${snapshot.data}', style: TextStyle(fontSize: 50),));
//                 }else{
//                   return Container(
//                     child: Center(child: Text('${snapshot.data}', style: TextStyle(fontSize: 50),)),
//                   );
//                 }
//
//               }
//             ),
//           ],
//         ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//            nController.sink.add(number++);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

