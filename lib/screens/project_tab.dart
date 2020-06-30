import 'package:flutter/material.dart';
import 'package:timely/utilities/constants.dart';
import 'package:timely/global_variables.dart';
import 'package:provider/provider.dart';
import 'package:timely/classes/project_model.dart';

class ProjectTab extends StatefulWidget {
  @override
  _ProjectTabState createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Consumer<ProjectModel>(
        builder: (context,projectModel,child){
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20),
            physics: BouncingScrollPhysics(),
              itemCount: projectModel.projects.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                if(projectModel.projects.length != 0){
                  return  ProjectCard(
                    name: projectModel.projects[index].projectName,
                    color: projectModel.projects[index].tagColor,
                    duration: projectModel.projects[index].totalDuration,
                    onPressed: (){
                      projectModel.removeProject(index);
                    },
                  );
                }else{
                  return null;
                }
              }

          );
        },
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key key,
    this.name,
    this.color,
    this.duration,
    this.onPressed,
  }) : super(key: key);
  final name;
  final color;
  final duration;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        padding: EdgeInsets.symmetric(vertical: 20),
//          height: MediaQuery.of(context).size.height*0.23,
        width: MediaQuery.of(context).size.width*0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 15,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child:  Column(
          children: <Widget>[

            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10,right: 10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: onPressed,
                          child: Icon(
                            Icons.delete,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Colors.black26,
                    ),

                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      duration,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.02,),
            SizedBox(width: 20,),
            Container(
              width: MediaQuery.of(context).size.width *0.6,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius:BorderRadius.circular(30)
              ),
              child: RaisedButton(
                onPressed: (){},
                elevation: 2,
                padding: EdgeInsets.all(0),
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        child: Text(
                          "Start a new task",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15
                          ),
                        ),
                      ),
                    ],
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
