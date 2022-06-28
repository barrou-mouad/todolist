import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:todo_list/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [Task(text: "LARAVEL"), Task(text: "PHP")];
  void addTask(String nom) {
    tasks.add(new Task(text: nom));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.changeCheck();
    notifyListeners();
  }

  void deleteTask(Task tats) {
    tasks.remove(tats);
    notifyListeners();
  }
}
