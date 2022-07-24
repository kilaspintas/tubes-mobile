import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

initializeNotifications() async {
  FirebaseMessaging fcm = FirebaseMessaging.instance;

  FirebaseMessaging.onMessage.listen(_onMessage);
  FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(_onOpened);

  try {
    if (Platform.isAndroid) {
      await fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      await fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      FirebaseMessaging.onMessage.listen((event) {});
      FirebaseMessaging.onBackgroundMessage((message) async {});
      FirebaseMessaging.onMessageOpenedApp.listen((event) {});
    }
  } catch (e) {
    debugPrint(e.toString());
  }

  final message = await fcm.getInitialMessage();
  // notif terminated
  if (message != null) {
    final data = message.data;
    debugPrint("keadaaan Terminated! $data");
    debugPrint("${message.notification?.body}");
  }

  debugPrint(
      "Token : ${(await FirebaseMessaging.instance.getToken()).toString()}");
}

// ketika on foreground
void _onMessage(RemoteMessage message) {
  debugPrint("Kamu menerima pesan ! ${message.notification?.title}");
  debugPrint("${message.notification?.body}");
}

// ketika on background
Future<void> _onBackgroundMessage(RemoteMessage message) async {
  debugPrint("Kamu menerima pesan ! ${message.notification?.title}");
  debugPrint("${message.notification?.body}");
}

//ketika notifikasi di klik dan keadaannya on background
void _onOpened(RemoteMessage message) async {
  final data = message.data;
  debugPrint("Kamu bisa melakukan apapun pada data ! $data");
}
