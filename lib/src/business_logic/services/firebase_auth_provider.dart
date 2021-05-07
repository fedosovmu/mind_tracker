import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class FirebaseAuthProvider {
  FirebaseAuthProvider._();

  static User _user;
  static String uid;
  static Stream<String> authStateChanges = _getAuthStateChanges();
  static String get email => _user.email;

  static Stream<String> _getAuthStateChanges() {
    return FirebaseAuth.instance.authStateChanges().map((user) {
      print('[FIRABASE-AUTH] Auth State Changed: ${user != null ? user.uid : null}');
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
      print('[FIRABASE-AUTH] Error ${e.code}');
      return e.code;
    }
    return null;
  }

  static Future<String> createUserWithEmailAndPassword ({@required String email, @required String password}) async {
    try {
      final userCredential = FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      print('[FIRABASE-AUTH] Error ${e.code}');
      return e.code;
    }
    return null;
  }

  static Future<void> signOut() {
    print('[FIRABASE-AUTH] Sign out');
    FirebaseAuth.instance.signOut();
  }
}