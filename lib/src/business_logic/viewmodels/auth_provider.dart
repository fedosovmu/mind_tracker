import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_auth_provider.dart';


class AuthProvider extends ChangeNotifier {
  bool get isAuthorized => FirebaseAuthProvider.uid != null;
  String get email => isAuthorized ? FirebaseAuthProvider.email : null;

  AuthProvider() {
    initializeListeners();
  }

  void initializeListeners() {
    FirebaseAuthProvider.authStateChanges.listen((uid) {
      notifyListeners();
    });
  }

  Future<String> signInWithEmailAndPassword ({@required String email, @required String password}) async {
    return FirebaseAuthProvider.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<String> createUserWithEmailAndPassword({@required String email, @required String password}) async {
    return FirebaseAuthProvider.createUserWithEmailAndPassword(email: email, password: password);
  }

  void signOut() {
    FirebaseAuthProvider.signOut();
  }
}