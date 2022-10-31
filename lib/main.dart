import 'package:flutter/material.dart';
import 'package:todolist/ShowTasks.dart';
import 'package:todolist/classes/Tasks.dart';

import 'classes/Task.dart';

void main() {
  runApp(MyApp());
}
// zadanie, lista zadań
//ZADANIE => nazwa, kategoria
//  dodwanie zadania
//TODO wyświetlanie listy zdań => zmienia się jest statyczna

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  Tasks tasks = Tasks();

  @override
  Widget build(BuildContext context) {
    // tasks.addTask(Task("Testowy", "Obowiązki domowe"));
    // tasks.addTask(Task("Testowy2", "granie"));
    return MaterialApp(
        home: SizedBox(
            height: 250,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Lista zaadań'),
              ),
              body: ShowTasks(tasks: this.tasks),
            )));
  }
}
