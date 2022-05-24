import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects_start/provider/auth_provider.dart';
import 'package:flutter_projects_start/provider/crud_provider.dart';
import 'package:flutter_projects_start/widgets/drawer_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MainScreen extends StatelessWidget {

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final userData = ref.watch(usersStream);
        final postData = ref.watch(postStream);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text('FireApp'),

            ),
            drawer: DrawerWidget(),
            body: Column(
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

                Expanded(
                  child: Container(
                      child: postData.when(
                          data: (data){
                            return  ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index){
                                  final dat = data[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      height: 300,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(dat.title),
                                          if(user!.uid == dat.userId)    TextButton(
                                                  style: TextButton.styleFrom(
                                                    minimumSize: Size.zero, // Set this
                                                    padding: EdgeInsets.zero, // and this
                                                  ),
                                                  onPressed: (){

                                                  },
                                                  child: Icon(Icons.more_vert)
                                              )
                                            ],
                                          ),
                                          Image.network(dat.imageUrl,
                                            height: 200,
                                            width: double.infinity,
                                            fit: BoxFit.cover,),
                                          Text(dat.description, maxLines: 2, overflow: TextOverflow.ellipsis,),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                          error: (err, stack) => Text('$err'),
                          loading: () => Container()
                      )
                  ),
                ),


              ],
            )
        );
      }
    );
  }
}
