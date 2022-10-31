import 'package:flutter/material.dart';
import 'package:todolist/classes/Tasks.dart';
import 'package:todolist/classes/Task.dart';

import 'Task.dart';

class ShowTasks extends StatefulWidget {
  const ShowTasks({Key? key, required this.tasks}) : super(key: key);
  final Tasks tasks;
  @override
  State<ShowTasks> createState() => _ShowTasksState(tasks.getTasks());
}

class _ShowTasksState extends State<ShowTasks> {
  _ShowTasksState(this.tasks) {}
  List<Task> tasks;
  @override
  Widget build(BuildContext context) {
    // for (int i = 0; i < this.tasks.length;) {
    //   var task = this.tasks[i];
    //   print("ZADANIE");
    //   print(task.categories);
    // }
    return Column(
      children: [
        for (int i = 0; i < this.tasks.length; i++)
          TaskWidget(
            task: this.tasks[i],
          )
      ],
    );
  }
}
