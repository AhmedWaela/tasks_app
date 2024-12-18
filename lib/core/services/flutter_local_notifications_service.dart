import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tasks_app/features/tasks/presentation/views/add_reminder_view.dart';
import 'package:tasks_app/main.dart';
import 'package:uuid/uuid.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;

class FlutterLocalNotificationsService {
  // Create object from Flutter local notification plugin
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    bool? initializationResult =
        await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onDid,
      onDidReceiveNotificationResponse: onDid,
    );
    if (initializationResult != null && initializationResult == true) {
      debugPrint('Initialization Success');
    } else {
      debugPrint('Initialization Failed');
    }
  }

  static void onDid(NotificationResponse? details) {
    debugPrint('Notification clicked: ${details?.payload}');
    navigatorKey.currentState!.pushNamed(AddReminderView.route);
  }

  static Future<void> showBasicNotification() async {
    var notificationId = Uuid().v4();
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'Basic Notification Channel Id',
        'Basic Notification Channel',
        priority: Priority.high,
        importance: Importance.max,
        sound:
            RawResourceAndroidNotificationSound('sound.mp3'.split('.').first),
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
        'Repeated Notification Channel',
        priority: Priority.high,
        importance: Importance.max,
        sound:
            RawResourceAndroidNotificationSound('sound.mp3'.split('.').first),
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

  static Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<void> showScheduleNotification(
      int id, String title, String description, DateTime scheduledTime) async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'Schedule Notification Channel Id',
        'Schedule Notification Channel',
        priority: Priority.high,
        importance: Importance.max,
        sound:
            RawResourceAndroidNotificationSound('sound.mp3'.split('.').first),
      ),
      iOS: DarwinNotificationDetails(),
    );

    try {
      // Get the timezone and set the local timezone
      tz.initializeTimeZones();
      String realLocation = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(realLocation));

      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        description,
        tz.TZDateTime.from(scheduledTime, tz.local),
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exact,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );

      debugPrint('Scheduled notification successfully!');
    } catch (e) {
      debugPrint('Error scheduling notification: $e');
    }
  }
}
