import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


abstract class FirebaseProvider {
  static void initializeFirebaseConnection () async {
    final firebaseInitializeData = await Firebase.initializeApp();
    print('FIREBASE INITIALIZED'); // TODO: Delete this line
    final mood_assessments_for_day_collection = FirebaseFirestore.instance.collection('mood_assessments_for_day');
    mood_assessments_for_day_collection.get().then((data) {
      final mood_assessments = data.docs.map((e) => e.data());
      print('DOCUMENTS: $mood_assessments'); // TODO: delete this line
    });
  }
}