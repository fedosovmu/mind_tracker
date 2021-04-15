import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class FirebaseAuthProvider {
  static UserCredential userCredential;

  static Future<UserCredential> signInAnonymously() async {
    userCredential = await FirebaseAuth.instance.signInAnonymously();
    print('=== Anonymous user: ${userCredential.user.uid}');
    return userCredential;
  }
}