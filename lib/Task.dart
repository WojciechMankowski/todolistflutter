import 'package:flutter/material.dart';
import 'classes/Task.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(task.nameTask),
        Text(task.categories)
      ],
    );
  }
}
