import 'package:flutter/material.dart';
import 'package:timely/utilities/constants.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class ProjectTab extends StatefulWidget {
  @override
  _ProjectTabState createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height:MediaQuery.of(context).size.height*0.04,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
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
                        height: 80,
                        width: 80,
                        child: Container(
                          child: Image(image: Svg('images/google.svg',height: 60)),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Social Media App",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 30,
                                padding: EdgeInsets.symmetric(horizontal: 20),
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
                                    "06:23:05",
                                    style: TextStyle(
                                      fontSize: 16,
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


                ],
              ),
              SizedBox(height:MediaQuery.of(context).size.height*0.02,),
              SizedBox(width: 20,),


              Container(
                width: MediaQuery.of(context).size.width *0.5,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          "Start a new task",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15
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
      ],
    );
  }
}
