import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: [
            _buildContainer(Colors.blueGrey, 'hello user'),
            _buildContainer(Colors.pink, 'something new'),
          ],
        ),
      ),
    ));
  }

  Container _buildContainer(Color c, String label) {
    return Container(
      color: c,
      height: 200,
      width: 200,
      child: Text(label),
    );
  }
}
