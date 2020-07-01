
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'signup.dart';

class SplashScreen extends StatefulWidget {
  static String id = "splash_screen";
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<FirebaseUser> (
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
          if (snapshot.hasData){
            FirebaseUser user = snapshot.data; // this is your user instance
            return HomeScreen();
          }
          return SignupPage();
        }
    );
  }
}

