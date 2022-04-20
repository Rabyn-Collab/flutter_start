



abstract class LifeCycle{
  void sleep();
  void eat();
}


class Person extends LifeCycle{
  @override
  void eat() {
    print('person is sleeping');
  }

  @override
  void sleep() {
   print('person is eating');
  }


}








