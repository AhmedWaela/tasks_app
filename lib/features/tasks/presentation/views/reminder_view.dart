import 'package:flutter/material.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/reminder_view_body.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffF6FFF9),
      body: ReminderViewBody(),
    );
  }
}
