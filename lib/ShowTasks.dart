import 'package:cloud_firestore/cloud_firestore.dart';
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


class ShowTask2 extends StatelessWidget {
  const ShowTask2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(stream: FirebaseFirestore.instance.collection('tasks').snapshots(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
        if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.docs.map((document) {
              return Container(
                child: Center(child: Text(document['text'])),
              );
               }).toList();
       },),
    );
  }
}