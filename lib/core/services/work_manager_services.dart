// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:tasks_app/core/services/flutter_local_notifications_service.dart';
import 'package:tasks_app/features/tasks/data/models/task_model.dart';
import 'package:uuid/uuid.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerServices {
  static Future<void> initialize() async {
    await Workmanager().initialize(callbackDispatcher);
  }

  static Future<void> registerMyTask() async {
    var id = Uuid().v4();
    var dateTime = DateTime(2024, 12, 18, 17, 42);
    TaskModel taskModel = TaskModel(
        taskId: id.hashCode,
        title: 'Hello',
        dateTime: dateTime,
        description: 'Hi');
    var task = taskModel.toMap();
    await Workmanager().registerOneOffTask(
      '$id',
      taskModel.title,
      inputData: task,
      initialDelay: Duration.zero,
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
