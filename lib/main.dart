import 'package:flutter/material.dart';
import 'package:flutter_projects_start/provider/counter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';



void main(){
  runApp(ProviderScope(child: Home()));

}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
          home: Counter(),
    );
  }
}

class Counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [

                ],
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight
              )
            ),
            width: double.infinity,
            child: Consumer(
              builder: (context, ref, child) {
                final number = ref.watch(counterProvider).number;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('$number', style: TextStyle(fontSize: 50),),
                    TextButton(
                        onPressed: () {
                      ref.read(counterProvider).increment();
                        },
                        child: Text('increment', style: TextStyle(fontSize: 50))
                    ),
                    TextButton(
                        onPressed: () {
                          ref.read(counterProvider).decrement();
                        },
                        child: Text('decrement', style: TextStyle(fontSize: 50))
                    )
                  ],
                );
              }
            ),
          )
        )
    );
  }
}
