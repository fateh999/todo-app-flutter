import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  int editIndex = -1;

  addTask(String name) {
    tasks.add(new Task(name: name));
    notifyListeners();
  }

  deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  setEditIndex(int index) {
    editIndex = index;
    notifyListeners();
  }

  updateTask(String name) {
    if (editIndex == -1) {
      return;
    }
    var task = tasks[editIndex];
    task.name = name;
    notifyListeners();
  }

  updateCheckbox(bool status, int index) {
    var task = tasks[index];
    task.isDone = status;
    notifyListeners();
  }
}
