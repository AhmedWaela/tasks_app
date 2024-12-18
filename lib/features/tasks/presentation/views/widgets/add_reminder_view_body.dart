import 'package:flutter/material.dart';

class AddReminderViewBody extends StatelessWidget {
  const AddReminderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Column(
        children: [
          CustomTextField(),
          CustomTextField(),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 48,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [Text('Title'), Spacer(), Icon(Icons.keyboard)],
          ),
          TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))),
          )
        ],
      ),
    );
  }
}
