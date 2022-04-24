import 'package:flutter/material.dart';
import 'package:flutter_projects_start/screens/detail_screen.dart';
import 'package:get/get.dart';

import '../models/book.dart';





class DetailContainer extends StatelessWidget {

  final double height;
  final Axis axis;
  final Function container;

  DetailContainer({required this.height,required this.axis,required this.container});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: axis,
          itemCount: books.length,
          itemBuilder: (context, index){
            final book = books[index];
            return  InkWell(
              onTap: (){
               Get.to(() => DetailScreen(book), transition: Transition.leftToRight);
              },
              child: container(book),
            );
          }
      ),
    );
  }
}