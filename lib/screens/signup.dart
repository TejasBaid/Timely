import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'package:timely/utilities/constants.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';

class SignupPage extends StatefulWidget {
  static String id = "signup_page";
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _auth = FirebaseAuth.instance;
  var showpass = true;
  var errorMessage;
  String email;
  String password;
  void errToast(message){
    FlutterFlexibleToast.showToast(
        message: message,
        toastLength: Toast.LENGTH_LONG,
        toastGravity: ToastGravity.BOTTOM,
        icon: ICON.CLOSE,
        fontSize: 13,
        radius: 60,
        elevation: 2,
        imageSize: 25,
        textColor: Colors.white,
        backgroundColor: Colors.redAccent,
        timeInSeconds: 1.5.toInt()
    );
  }
  void successToast(){
    FlutterFlexibleToast.showToast(
        message: "Sign up Successful",
        toastLength: Toast.LENGTH_LONG,
        toastGravity: ToastGravity.BOTTOM,
        icon: ICON.SUCCESS,
        fontSize: 13,
        radius: 60,
        elevation: 2,
        imageSize: 25,
        textColor: Colors.white,
        backgroundColor: Colors.green,
        timeInSeconds: 1.5.toInt()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                CustomHeader(text: "Sign up",),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    // override textfield's icon color when selected
                    primaryColor: Color(0xff809FBF),
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.perm_identity,
                              ),
                              labelText: 'First Name',
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
                      SizedBox(
                        width: 20,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          // override textfield's icon color when selected
                          primaryColor: Color(0xff809FBF),
                        ),
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(

                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.perm_identity,
                                ),
                                labelText: 'Last Name',
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
                      ),
                    ],
                  ),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    // override textfield's icon color when selected
                    primaryColor: Color(0xff809FBF),
                  ),
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.86,
                    child: TextField(
                      onChanged: (value){
                        email = value;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outline,
                          ),
                          labelText: 'Email',
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
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    // override textfield's icon color when selected
                    primaryColor: Color(0xff809FBF),
                  ),
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.86,
                    child: Stack(
                      children: <Widget>[
                        TextField(
                          onChanged: (value){
                            password = value;
                          },
                          obscureText: showpass,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff809FBF).withOpacity(0.6),
                              ),
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (showpass == false) {
                                  showpass = true;
                                } else {
                                  showpass = false;
                                }
                              });
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.black.withOpacity(0.5),
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                  child: RichText(
                    text: TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(
                            color: Colors.black, fontSize: 12),
                        children: <TextSpan>[
                          TextSpan(text: ' Sign in',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 12),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // navigate to desired screen
                                }
                          )
                        ]
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: RaisedButton(
                    onPressed: () async {
                      try {
                        final newUser =
                        await  _auth.createUserWithEmailAndPassword(email: email, password: password);
                        if (newUser != null) {
                          successToast();
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                      } catch (e) {
                        switch (e.code) {
                          case "ERROR_EMAIL_ALREADY_IN_USE":
                            errorMessage =
                            "The email is already in use please sign in.";
                            break;
                          case "ERROR_INVALID_EMAIL":
                            errorMessage =
                            "The email is invalid.";
                            break;

                          case "ERROR_WEAK_PASSWORD":
                            errorMessage =
                            "The password is weak.";
                            break;

                        }
                        print(e);
                        errToast(errorMessage);
                      }
                    },
                    splashColor: Colors.white,
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ));
  }
}

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key key,
    this.text
  }) : super(key: key);
  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 30,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30, left: 2),
          height: 17,
          width: 17,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(60)),
        ),
      ],
    );
  }
}
