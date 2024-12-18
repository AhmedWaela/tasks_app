import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:uuid/uuid.dart';

class FlutterLocalNotificationsService {
  // create object from flutter local notification plugin
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    bool? initaliztionResult = await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onDid,
      onDidReceiveNotificationResponse: onDid,
    );
    if (initaliztionResult != null && initaliztionResult == true) {
      debugPrint('Initialization Success');
    } else {
      debugPrint('Initialization Failed');
    }
  }

  static void onDid(details) {}

  static Future<void> showBasicNotification() async {
    var notificationId = Uuid().v4();
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'Basic Notification Channel Id',
        'Basic Notification Channel Id',
        priority: Priority.high,
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
      notificationId.hashCode,
      'Basic Notification Title',
      'Basic Notification Body',
      notificationDetails,
    );
  }

  static Future<void> showRepeatedNotification() async {
    var notificationId = Uuid().v4();
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'Repeated Notification Channel Id',
        'Repeated Notification Channel Id',
        priority: Priority.high,
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      notificationId.hashCode,
      'Repeated Notification Title',
      'Repeated Notification Body',
      RepeatInterval.everyMinute,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exact,
    );
  }

  static Future<void> cancelNotification(int notificationId) async {
    await flutterLocalNotificationsPlugin.cancel(notificationId);
  }
}
