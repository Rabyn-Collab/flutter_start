import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_projects_start/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final usersStream =
    StreamProvider.autoDispose((ref) => CrudProvider().getUserData);
final userSingleStream =
    StreamProvider.autoDispose((ref) => CrudProvider().getSingleUserData);

final crudProvider = Provider((ref) => CrudProvider());

class CrudProvider {
  CollectionReference userDB = FirebaseFirestore.instance.collection('users');
  CollectionReference postDB = FirebaseFirestore.instance.collection('posts');

  Future<String> postAdd(
      {required String title,
      required String description,
      required String userId,
      required XFile image}) async {
    try {
      final imageId = image.name;
      final ref =
          FirebaseStorage.instance.ref().child('userImages/${image.name}');
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

  Stream<List<Users>> get getUserData {
    return userDB.snapshots().map((event) => getUser(event));
  }

  List<Users> getUser(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((e) => Users.fromJson((e.data() as Map<String, dynamic>)))
        .toList();
  }

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
