import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/services/cloud_firestore_provider.dart';


class SettingsProvider extends ChangeNotifier {
  Map<String, dynamic> settings;

  Future<void> loadData() async {
    final isCreated = await CloudFirestoreProvider.createSettingsDocIfNotExists();
    if (!isCreated) {
      await CloudFirestoreProvider.updateSettingsLastStartAppInformation();
    }
    settings = await CloudFirestoreProvider.getSettings();
    notifyListeners();
    return;
  }
}