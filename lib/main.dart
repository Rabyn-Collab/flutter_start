import 'package:flutter/material.dart';
import 'package:flutter_projects_start/screens/home_screen.dart';
import 'package:get/get.dart';




void main (){
runApp(Home());
}




class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        home: HomeScreen()
    );
  }
}


class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            height: 350,
            width: double.infinity,
            child: Column(
              children: [
                Image.asset('assets/images/joel-muniz-KodMXENNaas-unsplash.jpg',
                  height: 300,
                  fit: BoxFit.cover,),
                Text('asl;dk;lskal;'),
                Text('asl;dk;lskal;'),
              ],
            ),
          ),
        )
    );
  }
}












































