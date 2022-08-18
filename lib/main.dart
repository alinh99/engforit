import 'package:eft_project/Screens/home/home.dart';
import 'package:eft_project/Screens/login/login.dart';
import 'package:eft_project/Screens/splash/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        child: Scaffold(
          body: Splash(),
        ),
      ),
      routes: {
        Splash.id: (context) => const Splash(),
        Login.id: (context) => const Login(),
        Home.id:(context) => const Home(),
      },
    );
  }
}
