import 'package:flutter/material.dart';
import 'project.dart';

class ProjectModel extends ChangeNotifier{
  List<Project> projects = [

  ];

  void addProject(String name,Color color,String duration){
    final projectObject = Project(
      projectName: name,
      tagColor: color,
      totalDuration: duration,
    );
    projects.add(projectObject);
    notifyListeners();
  }

  void removeProject(index){
    projects.removeAt(index);
    notifyListeners();
  }

}