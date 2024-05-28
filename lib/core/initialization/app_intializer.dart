import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/firebase_options.dart';

class AppInitializer {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
