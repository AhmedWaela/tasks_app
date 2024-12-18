import 'package:flutter/material.dart';

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
