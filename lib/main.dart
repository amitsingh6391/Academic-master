import 'package:academic_master/firebase_option.dart';
import 'package:academic_master/injection.dart';
import 'package:academic_master/presentation/core/app_widget.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection(Environment.prod);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    AppWidget(), // Wrap your app
  );
}
