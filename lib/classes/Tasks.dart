// ignore_for_file: unnecessary_this

import 'Task.dart';

class Tasks {
  List<Task> tasks = [];

  void addTask(Task task){
    this.tasks.add(task);
  }
  List<Task> getTasks(){
    return this.tasks;
  }

}
