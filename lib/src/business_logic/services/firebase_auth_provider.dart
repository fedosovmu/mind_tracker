import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthProvider {
  FirebaseAuthProvider._();

  static UserCredential _userCredential;
  static String uid;
  static var authStateChanges;

  static void initializeListeners() {
    authStateChanges = FirebaseAuth.instance.authStateChanges().map((user) {
      print('====== Auth State Changed ======');
      print('=== USER: $user');
      if (user != null) {
        uid = user.uid;
      } else {
        uid = null;
      }
    });
  }

  static Future<String> signInAnonymously() async {
    _userCredential = await FirebaseAuth.instance.signInAnonymously();
    print('====== Sign In Anonymously ======');
    print('=== Anonymous user: ${_userCredential.user.uid}');
  }

  static Future<String> signInWithEmailAndPassword() async {
    try {
      _userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
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