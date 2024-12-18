import 'package:flutter/material.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/reminder_view_body.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: ReminderFloatingActionButton(),
      backgroundColor: Color(0xffF6FFF9),
      body: ReminderViewBody(),
    );
  }
}

class ReminderFloatingActionButton extends StatelessWidget {
  const ReminderFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
