import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timely/utilities/constants.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:timely/classes/task_model.dart';
import 'package:timely/classes/task.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
      Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Consumer<TaskModel>(
        builder: (context,taskModel,child){
          return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 15),
              physics: BouncingScrollPhysics(),
              itemCount: taskModel.taskList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                if(taskModel.taskList.length != 0){
                  return  TaskCard(
                    name: taskModel.taskList[index].name,
                    duration: '00:00:00',
                    color: taskModel.taskList[index].color,

                  );
                }else{
                  return null;
                }
              }

          );
        },
      ),
    ),


        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key key,
    this.duration,
    this.name,
    this.color,
  }) : super(key: key);
  final name;
  final duration;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width*0.9,
      height: 100,
      decoration: BoxDecoration(
        color: kSecondaryColor,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 15,),
                  Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 70,
                    width: 70,
                    child: Container(
                      child: Image(image: Svg('images/google.svg',height: 60)),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: color,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 25,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.7,
                                color: Colors.black26,
                              ),

                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                duration,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),


                    ],
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,

                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: RaisedButton(
                      focusElevation: 0,
                      highlightElevation: 0,
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      padding: EdgeInsets.all(0),
                      onPressed: (){
                      },
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
