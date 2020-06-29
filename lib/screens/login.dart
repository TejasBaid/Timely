import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  static String id = "login_page";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  var showpass = true;
  var errorMessage;
  String email;
  String password;
  var eyeType = FontAwesomeIcons.solidEye;
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
        message: "Login Successful",
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
        body: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                CustomHeader(text: "Sign in",),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
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
                                  eyeType = FontAwesomeIcons.solidEyeSlash;
                                } else {
                                  showpass = false;
                                  eyeType = FontAwesomeIcons.solidEye;
                                }
                              });
                            },
                            icon: Icon(
                              eyeType,
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
                    Navigator.pushNamed(context, SignupPage.id);
                  },
                  child: RichText(
                    text: TextSpan(
                        text: 'Dont Have an account?',
                        style: TextStyle(
                            color: Colors.black, fontSize: 12),
                        children: <TextSpan>[
                          TextSpan(text: ' Sign up',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 12),

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
                    onPressed: ()
                    async {
                      try {
                        final newUser =
                        await  _auth.signInWithEmailAndPassword(email: email, password: password);
                        if (newUser != null) {
                          successToast();
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                      } catch (error) {
                        switch (error.code) {
                          case "ERROR_INVALID_EMAIL":
                            errorMessage = "Your email address appears to be malformed.";
                            break;
                          case "ERROR_WRONG_PASSWORD":
                            errorMessage = "Your password is wrong.";
                            break;
                          case "ERROR_USER_NOT_FOUND":
                            errorMessage = "User with this email doesn't exist.";

                            break;
                          case "ERROR_USER_DISABLED":
                            errorMessage = "User with this email has been disabled.";
                            break;
                          case "ERROR_TOO_MANY_REQUESTS":
                            errorMessage = "Too many requests. Try again later.";
                            break;
                          case "ERROR_OPERATION_NOT_ALLOWED":
                            errorMessage = "Signing in with Email and Password is not enabled.";
                            break;
                          default:
                            errorMessage = "An undefined Error happened.";
                        }
                        errToast(errorMessage);
                      }

                    },
                    splashColor: Colors.white,
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Log In",
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

