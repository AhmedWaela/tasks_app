import 'package:tasks_app/core/services/flutter_local_notifications_service.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerServices {
  static Future<void> initialize() async {
    await Workmanager().initialize(callbackDispatcher);
  }

  static Future<void> registerMyTask() async {
    await Workmanager().registerOneOffTask('id1', 'task1');
  }
}

void callbackDispatcher() {
  Workmanager().executeTask(
    (taskName, inputData) async {
      await FlutterLocalNotificationsService.showScheduleNotification();
      return Future.value(true);
    },
  );
}
