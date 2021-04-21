import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class FirebaseAuthProvider {
  FirebaseAuthProvider._();

  static User _user;
  static String uid;
  static Stream<String> authStateChanges;
  static String get email => _user.email;

  static void initializeListeners() {
    authStateChanges = FirebaseAuth.instance.authStateChanges().map((user) {
      print('=== Auth State Changed: ${user != null ? user.uid : null}');
      _user = user;
      if (user != null) {
        uid = user.uid;
      } else {
        uid = null;
      }
      return uid;
    }).asBroadcastStream();
  }

  static Future<String> signInWithEmailAndPassword({@required String email, @required String password}) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('[ERROR] No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('[ERROR] Wrong password provided for that user.');
      }
      return e.code;
    }
    return null;
  }

  static Future<void> signOut() {
    FirebaseAuth.instance.signOut();
  }
}