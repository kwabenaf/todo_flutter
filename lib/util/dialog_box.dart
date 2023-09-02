import 'package:flutter/material.dart';
import 'package:tut_todo/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller; // Text controller for user input
  VoidCallback onSave; // Callback when the Save button is pressed
  VoidCallback onCancel; // Callback when the Cancel button is pressed

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // User input field
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Save button
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 8),

                // Cancel button
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
