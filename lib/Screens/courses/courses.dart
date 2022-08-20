import 'package:eft_project/components/bottom_navigation_bar.dart';
import 'package:eft_project/enum.dart';
import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  static String id = 'courses';
  const Courses({Key key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(selected: MenuState.course),
      appBar: AppBar(
        title: const Text('Courses'),
      ),
      body: const Center(
        child: Text('Courses'),
      ),
    );
  }
}
