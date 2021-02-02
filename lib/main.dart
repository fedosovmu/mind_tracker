import 'package:flutter/material.dart';
import 'src/business_logic/services/initial_app_data_loader.dart';
import 'src/business_logic/models/initial_app_data.dart';
import 'dart:async';
import 'src/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initialAppData = await InitialAppDataLoader.loadInitialAppData();
  runApp(MindTrackerApp(initialAppData));
}




