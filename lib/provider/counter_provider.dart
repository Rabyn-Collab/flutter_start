import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final counterProvider = ChangeNotifierProvider((ref) => CounterProvider());
final counterProvider1 = StateProvider((ref) => 0);

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


final toggleProvider = ChangeNotifierProvider((ref) => ToggleProvider());

class ToggleProvider extends ChangeNotifier{

  bool loading = false;

  void toggle(){
     loading = !loading;
    notifyListeners();
  }



}