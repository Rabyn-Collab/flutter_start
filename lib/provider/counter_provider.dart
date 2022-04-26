import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




final countState = StateProvider((ref) => 0);



final countStateNotify = StateNotifierProvider<CounterState, int>((ref) => CounterState());

class CounterState extends StateNotifier<int>{
  CounterState() : super(0);

  void increment(){
     state++;
  }

  void decrement(){
     state--;
  }

}



final counterProvider = ChangeNotifierProvider((ref) => CounterProvider());

class CounterProvider extends ChangeNotifier{

  int number = 0;

  void increment(){
     number++;
     notifyListeners();
  }

     void decrement(){
        number--;
        notifyListeners();
  }

}


