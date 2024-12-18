// ignore_for_file: unnecessary_string_interpolations

import 'package:tasks_app/core/services/flutter_local_notifications_service.dart';
import 'package:tasks_app/features/tasks/data/models/task_model.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerServices {
  static Future<void> initialize() async {
    await Workmanager().initialize(callbackDispatcher);
  }

  static Future<void> registerMyTask(TaskModel task) async {
    if (task.dateTime.isBefore(DateTime.now())) {
      print('hhhhhh');
      return;
    }
    await Workmanager().registerOneOffTask(
      '${task.taskId}',
      task.title,
      inputData: task.toMap(),
      initialDelay: task.dateTime.difference(DateTime.now()),
    );
  }
}

void callbackDispatcher() {
  Workmanager().executeTask(
    (taskName, inputData) async {
      var taskModel = TaskModel.fromJson(inputData!);
      await FlutterLocalNotificationsService.showScheduleNotification(
          taskModel.taskId,
          taskModel.title,
          taskModel.description!,
          taskModel.dateTime);
      return Future.value(true);
    },
  );
}
