import 'package:flutter/material.dart';
import 'package:tut_todo/constants/constants.dart';

class MyButton extends StatelessWidget {
  final String text; // The text displayed on the button
  VoidCallback onPressed; // Callback for when the button is pressed

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed, // Call the provided onPressed callback
      color: Theme.of(context).primaryColor,
      textColor: tdWhite,
      child: Text(text), // Display the provided text on the button
    );
  }
}
