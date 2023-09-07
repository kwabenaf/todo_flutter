import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tut_todo/constants/constants.dart';

class ToDoTile extends StatelessWidget {
  final String taskName; // The name of the task
  final bool taskCompleted; // Whether the task is completed or not
  Function(bool?)? onChanged; // Callback for handling checkbox changes
  Function(BuildContext)? deleteFunction; // Callback for deleting the task

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 25,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction, // Call the provided delete callback
              icon: Icons.delete,
              backgroundColor: tddel,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged, // Call the provided onChanged callback
                activeColor: tdpurp,
              ),

              // Task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: mediumFont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
