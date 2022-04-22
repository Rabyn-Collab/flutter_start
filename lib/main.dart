import 'package:flutter/material.dart';
import 'package:flutter_projects_start/screens/home_screen.dart';



void main(){
  runApp(Home());
}


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
    );
  }
}



class Sample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
             border: Border.all(color: Colors.black)
            ),
            height: 500,
            width: 500,
            child: Wrap(
             // mainAxisAlignment: MainAxisAlignment.end,
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
             // crossAxisAlignment: CrossAxisAlignment.start,
             //  crossAxisAlignment: CrossAxisAlignment.center,
             //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                   Container(
                     color: Colors.black,
                     height: 50,
                     width: 50,
                   ),
                   SizedBox(width: 10,),
                   Container(
                     color: Colors.purple,
                     height: 50,
                     width: 50,
                   ),
                    SizedBox(width: 10,),
                   Container(
                     color: Colors.amber,
                     height: 50,
                     width: 50,
                   ),
                Container(
                  color: Colors.black,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10,),
                Container(
                  color: Colors.purple,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10,),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),

                Container(
                  color: Colors.black,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10,),
                Container(
                  color: Colors.purple,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10,),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.black,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10,),
                Container(
                  color: Colors.purple,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10,),
                Container(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                ),


              ],
            )

            // Column(
            //  // crossAxisAlignment: CrossAxisAlignment.center,
            //  // mainAxisAlignment: MainAxisAlignment.start,
            //  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //    Container(
            //      color: Colors.black,
            //      height: 50,
            //      width: 150,
            //    ),
            //    SizedBox(height: 20,),
            //    Container(
            //      color: Colors.purple,
            //      height: 50,
            //      width: 150,
            //    ),
            //     SizedBox(height: 20,),
            //    Container(
            //      color: Colors.amber,
            //      height: 50,
            //      width: 150,
            //    ),
            //
            //
            //   ],
            // )

          ),
        )
    );
  }
}




