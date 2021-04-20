import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_auth_provider.dart';


class AuthProvider extends ChangeNotifier {
  String get uid => FirebaseAuthProvider.uid;
  bool get isAuthorized => uid != null;

  AuthProvider() {
    initializeListeners();
  }

  void initializeListeners() {
    FirebaseAuthProvider.authStateChanges.listen((uid) {
      notifyListeners();
      print('AUTH PROVIDER EVENT');
    });
  }

  Future<String> signInWithEmailAndPassword ({@required String email, @required String password}) async {
    return FirebaseAuthProvider.signInWithEmailAndPassword(email: email, password: password);
  }

  void signOut() {
    FirebaseAuthProvider.signOut();
  }
}