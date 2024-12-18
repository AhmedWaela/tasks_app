import 'package:flutter/material.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/add_reminder_view_body.dart';

class AddReminderView extends StatelessWidget {
  const AddReminderView({super.key});
  static const String route = '/addreminderview';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF6FFF9),
      body: AddReminderViewBody(),
    );
  }
}
