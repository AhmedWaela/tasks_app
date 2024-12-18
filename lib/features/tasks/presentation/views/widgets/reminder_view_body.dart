import 'dart:convert'; // Add this import for JSON encoding/decoding
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks_app/features/tasks/data/models/task_model.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/task_widget.dart';

class ReminderViewBody extends StatefulWidget {
  const ReminderViewBody({super.key});

  @override
  State<ReminderViewBody> createState() => _ReminderViewBodyState();
}

class _ReminderViewBodyState extends State<ReminderViewBody> {
  List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  getTasks() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    List<String>? tasksJson = sharedPrefs.getStringList('tasks');

    if (tasksJson != null) {
      tasks = tasksJson.map((taskJson) {
        return TaskModel.fromJson(json.decode(taskJson));
      }).toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskWidget(taskModel: tasks[index]);
      },
    );
  }
}
