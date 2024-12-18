import 'package:flutter/material.dart';

class TaskModel {
  final int taskId;
  final String title;
  final String description;
  final DateTime dateTime;
  final TimeOfDay timeOfDay;

  TaskModel(
      {required this.taskId,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.timeOfDay});
}
