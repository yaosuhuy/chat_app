import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
  }) async {
    String res = "Some errors occurred";
    try {
      if (email.isNotEmpty || username.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        model.User user = model.User(
            email: email,
            username: username,
            password: password,
            uid: cred.user!.uid);

        // create new document in firestore db
        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            );
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // login user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some errors occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
