import 'package:flutter/material.dart';
import 'package:todolistflutter/AddNewTask.dart';
import 'package:todolistflutter/ShowTasks.dart';
import 'classes/Task.dart';
import 'classes/Tasks.dart';

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
    List<String> docIds = [];
    // Future getDocId() async{
    //   await FirebaseFirestore.instance.collection("tasks").get().then(
    //           (value) => value.docs.forEach((element) {
    //             print(element.reference);
    //           } ));

    // }
    // getDocId();
    return MaterialApp(
        home: SizedBox(
            height: 250,
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('Lista zaadań'),
                ),
                body: SingleChildScrollView(
                    child: Column(
                  children: [
                    ShowTasks(tasks: this.tasks),
                    AddNewTask(
                      tasks: tasks,
                    )
                  ],
                )))));
  }
}
