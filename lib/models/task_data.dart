import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  addTask(String name) {
    tasks.add(new Task(name: name));
    notifyListeners();
  }

  updateCheckbox(bool status, int index) {
    var task = tasks[index];
    task.isDone = status;
    notifyListeners();
  }

  deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
