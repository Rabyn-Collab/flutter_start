import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects_start/screens/home_screen.dart';
import 'package:flutter_projects_start/screens/user_screen.dart';
import 'package:get/get.dart';




void main (){

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    )
  );
runApp(Home());
}




class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        home: UserScreen()
    );
  }
}

