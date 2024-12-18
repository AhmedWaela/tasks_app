import 'package:flutter/material.dart';
import 'package:tasks_app/features/tasks/presentation/views/add_reminder_view.dart';

class ReminderFloatingActionButton extends StatelessWidget {
  const ReminderFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddReminderView.route);
        },
        backgroundColor: Colors.green,
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
