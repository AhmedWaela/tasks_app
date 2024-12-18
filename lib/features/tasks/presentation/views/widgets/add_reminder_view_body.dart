import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks_app/features/tasks/presentation/views/widgets/custom_text_field.dart';

class AddReminderViewBody extends StatelessWidget {
  const AddReminderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
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
                borderRadius: BorderRadius.circular(8), // Adds rounded corners
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
                  SvgPicture.asset(
                    'assets/images/Icon (1).svg',
                    height: 30,
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.green,
              thickness: 1.5, // Adjusted thickness for better visibility
            ),
          ],
        ),
      ),
    );
  }
}
