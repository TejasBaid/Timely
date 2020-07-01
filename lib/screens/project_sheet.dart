import 'package:flutter/material.dart';
import 'package:timely/classes/project.dart';
import 'package:timely/classes/project_model.dart';
import 'package:timely/screens/project_tab.dart';
import 'home_screen.dart';
import 'package:timely/classes/color_select.dart';
import 'package:timely/global_variables.dart';
import 'package:provider/provider.dart';



class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  Color color = Colors.redAccent;
  var name;
  List<ColorSelect> colors = [
    ColorSelect(color: Colors.redAccent,isSelected: true),
    ColorSelect(color: Colors.deepOrangeAccent,isSelected: false),
    ColorSelect(color: Colors.orangeAccent,isSelected: false),
    ColorSelect(color: Colors.green,isSelected: false),
    ColorSelect(color: Colors.teal,isSelected: false),
    ColorSelect(color: Colors.blueAccent,isSelected: false),
    ColorSelect(color: Colors.lightBlueAccent,isSelected: false),
    ColorSelect(color: Colors.deepPurpleAccent,isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff696C74),
      height: MediaQuery.of(context).size.height *0.5,
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
                  CustomHeader2(text:'Create a new project'),
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
                    labelText: 'Project Name',
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
              height: 25,

              child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        color = colors[index].color;
                        for(var i in colors){
                          if(i.isSelected == true){
                            setState(() {
                              i.isSelected = false;
                              colors[index].isSelected = true;
                            });
                          }
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 23,
                        width: 25,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: colors[index].isSelected ? Border.all(
                              color: Colors.black.withOpacity(0.3)
                          ):null

                        ),
                        child: Container(
                          height: 23,
                          width: 23,
                          decoration: BoxDecoration(
                            color: colors[index].color,
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
            SizedBox(height: 50,),
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
                  final Project projectObject = Project(
                      tagColor: color,
                      projectName: name,
                      totalDuration: "00:00:00"
                  );
                  Provider.of<ProjectModel>(context).addProject(name, color, "00:00:00");
                  setState(() {
                    Navigator.pop(context);

                  });
                },
                child: Center(
                  child: Text(
                    "Create Project",
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





