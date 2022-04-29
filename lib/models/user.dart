



class User{
  final String imageUrl;
  final String username;
  final String message;
  final String weekDay;
  
  User({
    required this.username,
    required this.imageUrl,
    required this.message,
    required this.weekDay
});
  
  
}

List<User> users = [
  User(
      username: 'Ram', imageUrl: 'assets/images/joel-muniz-KodMXENNaas-unsplash.jpg',
      message: 'hello', weekDay: 'sunday'),
  User(
      username: 'Sita', imageUrl: 'assets/images/joel-muniz-KodMXENNaas-unsplash.jpg',
      message: 'hi', weekDay: 'monday'),
  User(
      username: 'Hari', imageUrl: 'assets/images/joel-muniz-KodMXENNaas-unsplash.jpg',
      message: 'namste', weekDay: 'tuesday'),
  User(
      username: 'Raja', imageUrl: 'assets/images/joel-muniz-KodMXENNaas-unsplash.jpg',
      message: 'namaskar', weekDay: 'wednesday'),
];