import 'package:flutter/cupertino.dart';
import 'Task.dart';
import 'classes/Task.dart';
import 'classes/Tasks.dart';

class ShowTasks extends StatefulWidget {
  ShowTasks({Key? key, required this.tasks, required this.docIds})
      : super(key: key);
  final Tasks tasks;
  List<String> docIds = [];
  @override
  State<ShowTasks> createState() => _ShowTasksState(tasks.getTasks(), docIds);
}

class _ShowTasksState extends State<ShowTasks> {
  _ShowTasksState(this.tasks, this.docIds) {}
  List<Task> tasks;
  List<String> docIds = [];
  List items = [];
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < this.tasks.length; i++)
          TaskWidget(
            task: this.tasks[i],
          ),
      ],
    );
  }
}
