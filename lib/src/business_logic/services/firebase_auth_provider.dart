import 'package:firebase_auth/firebase_auth.dart';


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
    });
  }

  static Future<String> signInAnonymously() async {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    print('=== Sign In Anonymously: ${userCredential.user.uid}');
  }

  static Future<String> signInWithEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "mocoronco@gmail.com",
          password: "77777778"
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('=== No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('=== Wrong password provided for that user.');
      }
      return null;
    }
  }
}