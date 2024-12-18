import 'package:flutter/material.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/reminder_floating_action_button.dart';
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
