import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/services/cloud_firestore_provider.dart';


class SettingsProvider extends ChangeNotifier {
  Future<void> CreateDefaultSettingsDoc() async {
    final isCreated = await CloudFirestoreProvider.createSettingsDocIfNotExists();
    if (!isCreated) {
      await CloudFirestoreProvider.updateSettingsLastStartAppInformation();
    }
    notifyListeners();
    return;
  }
}