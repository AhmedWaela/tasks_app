import 'package:tasks_app/core/services/flutter_local_notifications_service.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerServices {
  static Future<void> initialize() async {
    await Workmanager().initialize(callbackDispatcher);
  }

  static Future<void> registerMyTask(int taskId, String taskName) async {
    await Workmanager().registerOneOffTask(
      '$taskId',
      taskName,
      inputData: {},
      initialDelay: Duration.zero,
    );
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
