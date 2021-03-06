import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/services/firestore.dart';

/// network port definitions
const int firestorePort = 8080;
const int functionsPort = 5001;
const int authPort = 9099;

/// current firebase mode. Make sure to keep this in 'online' mode for production
final FirebaseMode mode = FirebaseMode.online;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  switch (mode) {
    case FirebaseMode.local:
      String host = Platform.isAndroid ? '10.0.2.2' : 'localhost';
      FirebaseFirestore.instance.settings = Settings(
        host: '$host:$firestorePort',
        sslEnabled: false,
        persistenceEnabled: false,
      );
      FirebaseFunctions.instance.useFunctionsEmulator(host, functionsPort);
      await FirebaseAuth.instance.useEmulator('http://$host:$authPort');
      break;
    case FirebaseMode.online:
      break;
  }

  runApp(
    GetMaterialApp(
      onInit: () {
        Get.put(FirestoreService());
      },
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: FirebaseAuth.instance.currentUser != null ? Routes.home : Routes.login,
      getPages: AppPages.routes,
    ),
  );
}

enum FirebaseMode {
  online,
  local,
}
