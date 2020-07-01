import 'package:flutter/foundation.dart';

class Task{
  Task({this.name,this.fromProject,this.color});
  final name;
  final duration = '00:00:00';
  final fromProject;
  final color;
}