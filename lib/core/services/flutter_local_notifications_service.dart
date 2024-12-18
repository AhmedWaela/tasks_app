import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FlutterLocalNotificationsService {
  // create object from flutter local notification plugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    InitializationSettings initializationSettings = InitializationSettings();
    bool? initaliztionResult = await flutterLocalNotificationsPlugin
        .initialize(initializationSettings);
  }
}
