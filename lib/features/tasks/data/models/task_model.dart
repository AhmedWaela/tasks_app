import 'package:flutter/material.dart';

class TaskModel {
  final int taskId;
  final String title;
  final String? description;
  final DateTime dateTime;
  final TimeOfDay timeOfDay;

  TaskModel({
    required this.taskId,
    required this.title,
    this.description,
    required this.dateTime,
    required this.timeOfDay,
  });

  Map<String, dynamic> toMap() {
    return {
      'taskId': taskId,
      'title': title,
      if (description != null) 'description': description,
      'dateTime': dateTime,
      'timeOfDay': timeOfDay
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskId: json['taskId'],
      title: json['title'],
      dateTime: json['dateTime'],
      timeOfDay: json['timeOfDay'],
      description: json['description'],
    );
  }
}
