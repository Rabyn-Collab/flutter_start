import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_projects_start/model/post.dart';
import 'package:flutter_projects_start/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final usersStream =
    StreamProvider.autoDispose((ref) => CrudProvider().getUserData);
final userSingleStream =
    StreamProvider.autoDispose((ref) => CrudProvider().getSingleUserData);

final crudProvider = Provider((ref) => CrudProvider());

final postStream = StreamProvider((ref) => CrudProvider().getPostData);

class CrudProvider {
  CollectionReference userDB = FirebaseFirestore.instance.collection('users');
  CollectionReference postDB = FirebaseFirestore.instance.collection('posts');

  // post add in postDB
  Future<String> postAdd(
      {required String title,
      required String description,
      required String userId,
      required XFile image}) async {
    try {
      final imageId = image.name;
      final ref =
          FirebaseStorage.instance.ref().child('postImages/${image.name}');
      final imageFile = File(image.path);
      await ref.putFile(imageFile);
      final imageUrl = await ref.getDownloadURL();

      await postDB.add({
        'userId': userId,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'imageId': imageId,
        'comments': [],
        'like': {'likes': 0, 'usernames': []}
      });
      return 'success';
    } on FirebaseException catch (err) {
      return '${err.message}';
    }
  }

  // post update in postDB
  Future<String> postUpdate({required String title, required String description, required String postId,
     XFile? image, String? imageId }) async {
    try {

      if(image == null){
       await postDB.doc(postId).update({
         'title': title,
         'description': description
       });
      }else{
        final ref = FirebaseStorage.instance.ref().child('postImages/$imageId');
        await ref.delete();
        final newImageId = image.name;
        final ref1 = FirebaseStorage.instance.ref().child('postImages/$newImageId');
        final imageFile = File(image.path);
        await ref1.putFile(imageFile);
        final imageUrl = await ref1.getDownloadURL();
        await postDB.doc(postId).update({
          'title': title,
          'description': description,
          'imageUrl': imageUrl,
          'imageId': newImageId
        });

      }

      return 'success';
    } on FirebaseException catch (err) {
      return '${err.message}';
    }
  }


  // post remove in postDB

  Future<String> postRemove({required String postId, required String imageId }) async {
    try {
      final ref = FirebaseStorage.instance.ref().child('postImages/$imageId');
      await ref.delete();
      await postDB.doc(postId).delete();
      return 'success';
    } on FirebaseException catch (err) {
      return '${err.message}';
    }
  }






  // fetch postData from postDB
  Stream<List<Post>> get getPostData {
    return postDB.snapshots().map((event) => getPost(event));
  }

  List<Post> getPost(QuerySnapshot snapshot) {
    return   snapshot.docs.map((e) {
      final data = e.data() as Map<String, dynamic>;
      return Post(
          like: Like.fromJson(data['like']),
          imageUrl: data['imageUrl'],
          title: data['title'],
          comments: (data['comments'] as List).map((e) => Comments.fromJson(e)).toList(),
          description: data['description'],
          imageId: data['imageId'],
          postId: e.id,
          userId: data['userId']
      );
    }).toList();
  }





  // fetch userData from userDB

  Stream<List<Users>> get getUserData {
    return userDB.snapshots().map((event) => getUser(event));
  }

  List<Users> getUser(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((e) => Users.fromJson((e.data() as Map<String, dynamic>)))
        .toList();
  }

  // fetch  single userData from userDB
  Stream<Users> get getSingleUserData {
    final id = FirebaseAuth.instance.currentUser!.uid;
    final user = userDB.where('userId', isEqualTo: id).snapshots();
    return user.map((event) => getSingle(event));
  }

  Users getSingle(QuerySnapshot snapshot) {
    final singleData = snapshot.docs[0].data() as Map<String, dynamic>;
    return Users.fromJson(singleData);
  }
}
