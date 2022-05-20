import 'package:flutter/material.dart';
import 'package:flutter_projects_start/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text('FireApp'),
              actions: [
                TextButton(onPressed: () {
                  ref.read(authProvider).userLogOut();
                },
                    child: Text(
                      'Log Out', style: TextStyle(color: Colors.white),))
              ],
            ),
            body: Container()
        );
      }
    );
  }
}
