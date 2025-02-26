import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // login user
  Future<String>loginUser({
    required String email,
    required String password,
  }) async{
    String res = 'Some errors occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}