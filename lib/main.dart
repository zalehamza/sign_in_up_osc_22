import 'dart:async';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import './constants/constants.dart';
import './views/verification_otp.dart';
import './views/connexion.dart';
import 'package:get/get.dart';
import './routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: RouteName.init,
      getPages: appRoutes,
      locale: const Locale('fr', 'FR'),
    );
  }
}