import 'package:flutter/material.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/task_widget.dart';

class ReminderViewBody extends StatelessWidget {
  const ReminderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return TaskWidget();
      },
    );
  }
}
