import 'dart:convert';

import 'package:flutter/material.dart' hide TimePickerDialog;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks_app/core/services/work_manager_services.dart';
import 'package:tasks_app/features/tasks/data/models/task_model.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/custom_text_field.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/custom_time_picker_dialog.dart';
import 'package:uuid/uuid.dart';

class AddReminderViewBody extends StatefulWidget {
  const AddReminderViewBody({super.key});

  @override
  State<AddReminderViewBody> createState() => _AddReminderViewBodyState();
}

class _AddReminderViewBodyState extends State<AddReminderViewBody> {
  DateTime dateTime = DateTime.now();
  TimeOfDay? timeOfDay;
  var title = TextEditingController();
  var description = TextEditingController();
  @override
  void initState() {
    super.initState();
    timeOfDay = TimeOfDay.fromDateTime(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              CustomTextField(
                controller: title,
                label: 'Title',
              ),
              CustomTextField(
                controller: description,
                label: 'Description',
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 60, // Adjusted height for better alignment
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(8), // Adds rounded corners
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Align vertically
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter Date',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4), // Adds spacing between lines
                        Text(
                          '$dateTime',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        dateTime = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2024),
                                lastDate: DateTime(2040),
                                initialDate: DateTime.now()) ??
                            DateTime.now();
                      },
                      child: SvgPicture.asset(
                        'assets/images/Icon (1).svg',
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.green,
                thickness: 1.5, // Adjusted thickness for better visibility
              ),
              TimePickerDialog(
                initialTime: TimeOfDay.now(),
                onSelected: (time) {
                  timeOfDay = time;
                  setState(() {});
                },
              ),
              Text('${timeOfDay!.hour}'),
              Text('${timeOfDay!.minute}'),
              DoneButton(
                dateTime: DateTime(dateTime.year, dateTime.month, dateTime.day,
                    timeOfDay!.hour, timeOfDay!.minute),
                description: description,
                title: title,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DoneButton extends StatelessWidget {
  const DoneButton({
    super.key,
    required this.title,
    required this.description,
    required this.dateTime,
  });
  final TextEditingController title;
  final TextEditingController description;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var id = Uuid().v4(); // Generate a unique taskId
        var task = TaskModel(
          taskId: id.hashCode, // Use the UUID directly as taskId
          title: title.text,
          dateTime: dateTime,
          description: description.text,
        );

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        List<String> tasks = sharedPreferences.getStringList('tasks') ?? [];

// Add the task to the list (convert it to a JSON string)
        tasks.add(jsonEncode(task.toMap()));

// Save the updated list to SharedPreferences
        await sharedPreferences.setStringList('tasks', tasks);
        print(tasks);

// Register the task with WorkManager (assuming WorkManagerServices is implemented correctly)
        await WorkManagerServices.registerMyTask(task);
      },
      child: Container(
        height: 48,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text('Done'),
        ),
      ),
    );
  }
}
