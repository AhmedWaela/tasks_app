import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FlutterLocalNotificationsService {
  // create object from flutter local notification plugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    bool? initaliztionResult = await flutterLocalNotificationsPlugin
        .initialize(initializationSettings);
    if (initaliztionResult != null && initaliztionResult == true) {
      debugPrint('Initialization Success');
    } else {
      debugPrint('Initialization Failed');
    }
  }
}
