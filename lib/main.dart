import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/business_logic/viewmodels/providers_initializer.dart';
import 'src/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final moodAssessmentsProvider = await ProvidersInitializer.getMoodAssessmentsProvider();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return moodAssessmentsProvider;
          })
        ],
        child: MindTrackerApp(),
      )
  );
}




