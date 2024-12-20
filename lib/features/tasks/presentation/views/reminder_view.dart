import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/reminder_floating_action_button.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/reminder_view_body.dart';

class ReminderView extends StatefulWidget {
  const ReminderView({super.key});
  static const String route = '/reminderview';

  @override
  State<ReminderView> createState() => _ReminderViewState();
}

class _ReminderViewState extends State<ReminderView> {
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    // Create a GlobalKey for the Showcase widget
    final GlobalKey showcaseKey = GlobalKey();

    // Wrap the entire screen with ShowCaseWidget to provide the necessary context
    return ShowCaseWidget(
      builder: (context) {
        if (isShow) {
          Future.delayed(const Duration(milliseconds: 200), () {
            ShowCaseWidget.of(context).startShowCase([showcaseKey]);
          });
          setState(() {
            isShow = false; // Set to false after the first showcase
          });
        }

        return Scaffold(
          floatingActionButton: Showcase(
            key: showcaseKey,
            title: 'Add Reminder',
            description: 'Click here to add a reminder',
            child: const ReminderFloatingActionButton(),
          ),
          backgroundColor: const Color(0xffF6FFF9),
          body: const ReminderViewBody(),
        );
      },
    );
  }
}
