import 'package:flutter/material.dart';
import 'task.dart';
class TaskModel extends ChangeNotifier{

  List<Task> taskList = [];

  void addTask(name,color,fromProject){
    Task task = Task(name: name,color: color,fromProject: fromProject);
    taskList.add(task);
    notifyListeners();
  }

}