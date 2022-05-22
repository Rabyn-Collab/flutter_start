import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_projects_start/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final usersStream = StreamProvider.autoDispose((ref) => CrudProvider().getUserData);

class CrudProvider{

 CollectionReference userDB = FirebaseFirestore.instance.collection('users');

 Stream<List<Users>> get getUserData{
      return  userDB.snapshots().map((event) => getUser(event));
}

 List<Users>  getUser(QuerySnapshot snapshot){
   return snapshot.docs.map((e) => Users.fromJson((e.data() as Map<String, dynamic>))).toList();
 }



  

}