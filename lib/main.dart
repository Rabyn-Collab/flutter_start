import 'package:flutter/cupertino.dart';
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
          child: Consumer(
            builder: (context, ref, child) {
            //  final number = ref.watch(counterProvider).number;
              final number = ref.watch(counterProvider1);
             final isLoad = ref.watch(toggleProvider).loading;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$number', style: TextStyle(fontSize: 50),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            ref.read(counterProvider1.notifier).state++;
                      // ref.read(counterProvider).increment();
                      // ref.read(toggleProvider).toggle();
                          }, child: isLoad ? CircularProgressIndicator(): Text('add')
                      ),
                      TextButton(
                          onPressed: () {
                            ref.read(counterProvider).decrement();
                            ref.read(toggleProvider).toggle();
                          }, child: Text('minus')),
                    ],
                  )
                ],
              );
            }
          ),
        )
    );
  }
}






