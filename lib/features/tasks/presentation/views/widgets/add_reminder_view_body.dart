import 'package:flutter/material.dart' hide TimePickerDialog;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/custom_text_field.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/custom_time_picker_dialog.dart';

class AddReminderViewBody extends StatefulWidget {
  const AddReminderViewBody({super.key});

  @override
  State<AddReminderViewBody> createState() => _AddReminderViewBodyState();
}

class _AddReminderViewBodyState extends State<AddReminderViewBody> {
  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime? dateTime = DateTime.now();
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
                controller: TextEditingController(),
                label: 'Title',
              ),
              CustomTextField(
                controller: TextEditingController(),
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
                      children: const [
                        Text(
                          'Enter Date',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4), // Adds spacing between lines
                        Text(
                          'yy/mm',
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
                            initialDate: DateTime.now());
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
            ],
          ),
        ),
      ),
    );
  }
}
