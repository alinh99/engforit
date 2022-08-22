import 'package:eft_project/Screens/courses/courses.dart';
import 'package:eft_project/Screens/enroll_lesson/components/enroll_successfull%20_reading.dart';
import 'package:eft_project/Screens/enroll_lesson/components/enroll_successfull_listening.dart';
import 'package:eft_project/Screens/enroll_lesson/components/enroll_successfull_speaking.dart';
import 'package:eft_project/Screens/enroll_lesson/components/enroll_successfull_writing.dart';
import 'package:eft_project/Screens/enroll_lesson/listening.dart';
import 'package:eft_project/Screens/enroll_lesson/reading.dart';
import 'package:eft_project/Screens/enroll_lesson/speaking.dart';
import 'package:eft_project/Screens/enroll_lesson/writing.dart';
import 'package:eft_project/Screens/home/home.dart';
import 'package:eft_project/Screens/lesson_detail/listening_detail.dart';
import 'package:eft_project/Screens/lesson_detail/reading_detail.dart';
import 'package:eft_project/Screens/lesson_detail/speaking_detail.dart';
import 'package:eft_project/Screens/lesson_detail/writing_detail.dart';
import 'package:eft_project/Screens/login/login.dart';
import 'package:eft_project/Screens/login/successfully_login.dart';
import 'package:eft_project/Screens/login/successfully_register.dart';
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
        Home.id: (context) => const Home(),
        SuccessfulLogin.id: (context) => const SuccessfulLogin(),
        SuccessfulRegister.id: (context) => const SuccessfulRegister(),
        Courses.id: (context) => const Courses(),
        Listening.id: (context) => const Listening(),
        Reading.id: (context) => const Reading(),
        Speaking.id: (context) => const Speaking(),
        Writing.id: (context) => const Writing(),
        SuccessfulEnrollReading.id: (context) => const SuccessfulEnrollReading(),
        SuccessfulEnrollSpeaking.id: (context) => const SuccessfulEnrollSpeaking(),
        SuccessfulEnrollWriting.id: (context) => const SuccessfulEnrollWriting(),
        SuccessfulEnrollListening.id: (context) => const SuccessfulEnrollListening(),
        ListeningDetail.id: (context) => const ListeningDetail(),
        ReadingDetail.id: (context) => const ReadingDetail(),
        SpeakingDetail.id: (context) => const SpeakingDetail(),
        WritingDetail.id: (context) => const WritingDetail(),
      },
    );
  }
}
