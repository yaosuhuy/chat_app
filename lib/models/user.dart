// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String email;
  final String password;
  User({
    required this.username,
    required this.uid,
    required this.email,
    required this.password,
  });
   // convert an object 'User' to a map, so we can store it in Firestore
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'password': password,
      };

  // convert a DocumentSnapshot that received from firebase to an object "User"
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      password: snapshot['password'],
    );
  }
}
