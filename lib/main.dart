import 'package:flutter/material.dart';
import 'package:flutter_projects_start/provider/counter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';



   Future<String> getData() async{
     print('hello user');
      await Future.delayed(Duration(seconds: 2));
     print('hello user1');
      throw Exception('some err');
   }




void main() async{
     try{
      final response = await getData();
      print(response);
     }catch (err){
      print(err);
     }


  runApp(ProviderScope(child: Home()));
}


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       debugShowCheckedModeBanner: false,
      home:  Counter(),
    );
  }
}





class Counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: Consumer(
              builder: (context, ref, child) {
                final number = ref.watch(countStateNotify);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$number', style: TextStyle(fontSize: 50),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                             ref.read(countStateNotify.notifier).increment();
                            },
                            child: Text('add')
                        ),
                        TextButton(
                            onPressed: () {
                              ref.read(counterProvider).decrement();
                            },
                            child: Text('minus')
                        ),
                      ],
                    )
                  ],
                );
              }
            ),
          ),
        )
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




