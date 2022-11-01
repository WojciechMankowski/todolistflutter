import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:todolist/AddNewTask.dart';
import 'package:todolist/ShowTasks.dart';
import 'package:todolist/classes/Tasks.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Tasks tasks = Tasks();
  List<String> docIds = [];

  getDate() async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .get()
        .then((value) => value.docs.forEach((element) {
              print(element.reference.id);
              docIds.add(element.reference.id);
            }));
    FirebaseDatabase database = FirebaseDatabase.instance;
    docIds.forEach((element) async {
      DatabaseReference starCountRef =
          FirebaseDatabase.instance.ref('taks/$element/task');
      starCountRef.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value;
        print(data);
        // updateStarCount(data);
      });
      // print('ref');
      // final ref = FirebaseDatabase.instance.ref();
      // print('tasks/$element/task');
      // final snapshot = await ref.child('tasks/$element/task').get();
      // print(snapshot.value);
      // if (snapshot.exists) {
      //   print(snapshot.value);
      // } else {
      //   print('No data available.');
      // }
      FirebaseDatabase database = FirebaseDatabase.instance;
      DatabaseReference ref = FirebaseDatabase.instance.ref("tasks/123");
      DatabaseReference child = ref.child("name");
      print(ref.key); // "123"
      print(ref.parent!.key); // "users"

      DatabaseEvent event = await ref.once();
      print("event");
      print(event.snapshot.value);
      //
    });
  }

  @override
  void initState() {
    getDate();
    super.initState();
  }

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
                body: SingleChildScrollView(
                    child: Column(
                  children: [
                    ShowTasks(tasks: this.tasks, docIds: this.docIds),
                    AddNewTask(
                      tasks: tasks,
                    )
                  ],
                )))));
  }
}
