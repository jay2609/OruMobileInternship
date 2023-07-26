import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'Utils/local_notification_service.dart';
import 'app/routes/app_pages.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  log(message.data.toString());
  log(message.notification!.title.toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(156, 32, 34, 51),
        colorScheme: const ColorScheme.light().copyWith(
          background: const Color.fromARGB(156, 32, 34, 51),
          secondary: const Color.fromARGB(156, 32, 34,
              100), // Use 'secondary' property for the accent color
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
