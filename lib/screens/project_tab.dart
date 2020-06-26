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
          height: MediaQuery.of(context).size.height*0.5,
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
              SizedBox(height: 20,),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Social Media App",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            "Total Time: 06:21:00",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                            ),
                          ),


                        ],
                      ),
                    ],
                  ),


                ],
              ),
              SizedBox(height:MediaQuery.of(context).size.height*0.02,),
              SizedBox(width: 20,),

              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Recents",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Row(
                  children: <Widget>[
                    Row(

                      children: <Widget>[
                        SizedBox(width: 20,),
                        Text(
                          "Social Media App",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),

                        Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12
                            )
                          ),
                          margin: EdgeInsets.only(left: 20),
                          child: Center(
                            child: Text(
                              "06:21:00",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,

                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: RaisedButton(
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            padding: EdgeInsets.all(0),
                            onPressed: (){},
                            child: Center(
                              child: Icon(
                                Icons.play_arrow,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
