import 'package:flutter/material.dart';
//import 'package:timely/classes/project.dart';
//import 'package:timely/classes/project_model.dart';
import 'package:timely/classes/task_model.dart';
//import 'package:timely/screens/project_tab.dart';
import 'home_screen.dart';
//import 'package:timely/classes/color_select.dart';
//import 'package:timely/global_variables.dart';
import 'package:provider/provider.dart';



class AddTask extends StatefulWidget {
  AddTask({this.projectName,this.color});
  final projectName;
  final color;
  @override
  _AddTaskState createState() => _AddTaskState(projectName: projectName,color: color);
}

class _AddTaskState extends State<AddTask> {
  _AddTaskState({this.projectName,this.color});
  final projectName;
  final color;
  var name;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff696C74),
      height: MediaQuery.of(context).size.height *0.35,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomHeader2(text:'Create a new task'),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextField(
                onChanged: (value){
                  name = value;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.text_fields,
                    ),
                    labelText: 'Task Name',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff809FBF).withOpacity(0.6),
                        ))),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),


            Container(
              height: 50,
              width: MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: RaisedButton(
                padding: EdgeInsets.all(0),
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: (){
                  Provider.of<TaskModel>(context).addTask(name, color, projectName);
                  Navigator.pop(context);


                },
                child: Center(
                  child: Text(
                    "Create Task",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





