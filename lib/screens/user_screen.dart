import 'package:flutter/material.dart';
import 'package:flutter_projects_start/models/user.dart';




class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(
            children: users.map((e) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(e.imageUrl),
                  ),
                  title: Text(e.username),
                  subtitle: Text(e.message),
                  trailing: Text(e.weekDay),
                ),
              );
            }).toList(),
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            label: 'Save',
            icon: Icon(Icons.save)),
      ]),
    );
  }
}
