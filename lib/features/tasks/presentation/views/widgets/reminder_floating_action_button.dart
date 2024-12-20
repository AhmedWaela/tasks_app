import 'package:flutter/material.dart';
import 'package:tasks_app/features/tasks/presentation/views/add_reminder_view.dart';

class ReminderFloatingActionButton extends StatefulWidget {
  const ReminderFloatingActionButton({super.key});

  @override
  State<ReminderFloatingActionButton> createState() =>
      _ReminderFloatingActionButtonState();
}

class _ReminderFloatingActionButtonState
    extends State<ReminderFloatingActionButton> {
  bool isMessageVisible = true; // Change to false to hide the bubble

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: Stack(
        clipBehavior: Clip.none, // This ensures the bubble doesn't get clipped
        children: [
          GestureDetector(
            onTapCancel: () {
              // Add any functionality when the tap is cancelled, if needed.
            },
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddReminderView.route);
              },
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
          if (isMessageVisible) // Only show the bubble if the condition is true
            Positioned(
              top: -10, // Adjust the position of the bubble
              right: -10,
              child: CustomPaint(
                size: Size(150, 50), // Size of the bubble
                painter: MessageBubblePainter(),
              ),
            ),
        ],
      ),
    );
  }
}

class MessageBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent // WhatsApp-like color
      ..style = PaintingStyle.fill;

    // Draw the rounded rectangle for the message bubble
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    RRect roundedRect = RRect.fromRectAndRadius(rect, Radius.circular(12));
    canvas.drawRRect(roundedRect, paint);

    // Draw the tail of the message bubble
    Path tailPath = Path();
    tailPath.moveTo(size.width * 0.75, size.height);
    tailPath.lineTo(size.width * 0.85, size.height + 10);
    tailPath.lineTo(size.width * 0.95, size.height);
    tailPath.close();
    canvas.drawPath(tailPath, paint);

    // Draw the text inside the bubble
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: 'Hello!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: size.width - 20); // Adjust text width

    // Position the text in the center of the bubble
    textPainter.paint(
      canvas,
      Offset(10, (size.height - textPainter.height) / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint the bubble
  }
}
