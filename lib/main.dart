import 'package:flutter/material.dart';
import 'package:timely/classes/project_model.dart';
import 'package:timely/classes/task_model.dart';
import 'package:timely/screens/login.dart';
import 'package:timely/screens/signup.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'screens/project_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:  (context) => ProjectModel(),),
        ChangeNotifierProvider(
          create:  (context) => TaskModel(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: SplashScreen.id,
        routes: {
          ProjectTab.id: (context) => ProjectTab(),
          HomeScreen.id: (context) => HomeScreen(),
          SignupPage.id: (context) => SignupPage(),
          LoginPage.id: (context) => LoginPage(),
          SplashScreen.id: (context) => SplashScreen(),
        },
      ),
    );
  }
}
