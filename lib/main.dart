import 'package:academic_master/injection.dart';
import 'package:academic_master/presentation/core/app_widget.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();

  configureInjection(Environment.prod);
  await Firebase.initializeApp();

  runApp(
    AppWidget(), // Wrap your app
  );
}
