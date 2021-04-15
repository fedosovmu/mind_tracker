import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class FirebaseAuthProvider {
  FirebaseAuthProvider._();

  static String uid;
  static Stream<String> authStateChanges;

  static void initializeListeners() {
    authStateChanges = FirebaseAuth.instance.authStateChanges().map((user) {
      print('=== Auth State Changed: ${user != null ? user.uid : null}');
      if (user != null) {
        uid = user.uid;
      } else {
        uid = null;
      }
      return uid;
    }).asBroadcastStream();
  }

  static Future<String> signInAnonymously() async {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    print('Sign In Anonymously: ${userCredential.user.uid}');
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
      return null;
    }
  }

  static Future<void> signOut() {
    FirebaseAuth.instance.signOut();
  }
}