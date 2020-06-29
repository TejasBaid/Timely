import 'package:flutter/material.dart';
import 'package:timely/screens/login.dart';
import 'package:timely/screens/signup.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: SplashScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        SignupPage.id: (context) => SignupPage(),
        LoginPage.id: (context) => LoginPage(),
        SplashScreen.id: (context) => SplashScreen(),
      },
    );
  }
}
