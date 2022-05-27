import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects_start/model/post.dart';
import 'package:flutter_projects_start/model/user.dart';
import 'package:flutter_projects_start/provider/auth_provider.dart';
import 'package:flutter_projects_start/provider/crud_provider.dart';
import 'package:flutter_projects_start/screens/detail_screen.dart';
import 'package:flutter_projects_start/screens/edit_screen.dart';
import 'package:flutter_projects_start/widgets/drawer_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';


class MainScreen extends StatelessWidget {

  final user = FirebaseAuth.instance.currentUser;

  late Users currentUser;

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
                        currentUser = data.firstWhere((element) => element.userId == user!.uid);
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
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        height: 400,
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
                                               Get.defaultDialog(
                                                 title: 'Customize Post',
                                                 content: Text('edit or remove your post'),
                                                 actions: [
                                                   IconButton(
                                                       onPressed: (){
                                                         Navigator.of(context).pop();
                                                          Get.to(() => EditScreen(dat), transition:  Transition.leftToRight);
                                                   }, icon: Icon(Icons.edit)),
                                                   IconButton(
                                                       onPressed: (){
                                                         Navigator.of(context).pop();

                                                         Get.defaultDialog(
                                                             title: 'Remove Post',
                                                             content: Text('Are you sure you want to remove this post'),
                                                             actions: [
                                                               TextButton(
                                                                   onPressed: (){
                                                                     Navigator.of(context).pop();
                                                                     ref.read(crudProvider).postRemove(
                                                                         postId: dat.postId, imageId: dat.imageId);
                                                                   }, child: Text('yes')),
                                                               TextButton(
                                                                   onPressed: (){
                                                                     Navigator.of(context).pop();

                                                                   }, child: Text('no')),
                                                             ]
                                                         );

                                                       }, icon: Icon(Icons.delete))
                                                 ]
                                               );
                                                    },
                                                    child: Icon(Icons.more_vert)
                                                )
                                              ],
                                            ),
                                            InkWell(
                                              onTap: (){
                                                Get.to(() => DetailScreen(dat, currentUser), transition: Transition.leftToRight);
                                              },
                                              child: FittedBox(
                                                child: Hero(
                                                  tag: dat.imageUrl,
                                                  child: Image.network(dat.imageUrl,
                                                    height: 300,
                                                    width: 360,
                                                    fit: BoxFit.fill,),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(dat.description, maxLines: 2, overflow: TextOverflow.ellipsis,),
                                                  Spacer(),
                                             if(user!.uid != dat.userId)   Row(
                                                  children: [
                                                    IconButton(
                                                        onPressed: (){
                                                          if(dat.like.usernames.contains(currentUser.username)){
                                                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                              duration: Duration(milliseconds:700),
                                                                // action: SnackBarAction(label: '', onPressed: (){
                                                                //
                                                                // }),
                                                                content: Text('You\'ve already like this post')
                                                            ));
                                                          }else{
                                                            final newLike = Like(
                                                                likes: dat.like.likes + 1,
                                                                usernames: [...dat.like.usernames,currentUser.username ]
                                                            );

                                                            ref.read(crudProvider).addLike(postId: dat.postId, like: newLike);


                                                          }

                                                    }, icon: Icon(Icons.thumb_up),
                                                    ),
                                                  if(dat.like.likes != 0)  Text('${dat.like.likes}')
                                                  ],
                                                )

                                              ],
                                            ),
                                          ],
                                        ),
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
