import 'package:flutter/material.dart';

import 'classes/Task.dart';
import 'classes/Tasks.dart';

class AddNewTask extends StatelessWidget {
  AddNewTask({super.key, required this.tasks});
  final _formKey = GlobalKey<FormState>();
  final nameTask = TextEditingController();
  final categoryTask = TextEditingController();
  final Tasks tasks;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const Text(
          "Dodawanie zadania",
          style: TextStyle(fontSize: 40),
        ),
        Form(
          // ignore: sort_child_properties_last
          child: Column(children: [
            const Text(
              "Nazw zadania",
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: nameTask,
              onChanged: (value) => {
                print(nameTask.text)
              },
            ),
            Text(
              "Kategoria",
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: categoryTask,

              // labelText: 'Enter your username',
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  tasks.addTask(Task(
                    nameTask.text, categoryTask.text
                  ));
                }
              },
              child: const Text('Submit'),
            ),
          ]),
          key: _formKey,
        )
      ]),
    );
  }
}
