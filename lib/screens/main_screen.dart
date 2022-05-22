import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects_start/provider/auth_provider.dart';
import 'package:flutter_projects_start/provider/crud_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MainScreen extends StatelessWidget {

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final userData = ref.watch(usersStream);
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
            body: ListView(
              children: [
                Container(
                 height: 150,
                  child: userData.when(
                      data: (data){
                        final otherData = data.where((element) => element.userId != user!.uid).toList();
                        return  ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: otherData.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(otherData[index].userImage),
                                  ),
                                    SizedBox(height: 7,),
                                    Text(otherData[index].username),
                                  ],
                                ),
                              );
                            }
                        );
                      },
                      error: (err, stack) => Text('$err'),
                      loading: () => Container()
                  )
                ),
              ],
            )
        );
      }
    );
  }
}
