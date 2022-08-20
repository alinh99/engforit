import 'package:eft_project/components/category_cards.dart';
import 'package:eft_project/components/bottom_navigation_bar.dart';
import 'package:eft_project/constants.dart';
import 'package:eft_project/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  static String id = 'courses';
  const Courses({Key key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  CourseState courseState;
  @override
  void initState() {
    courseState = CourseState.all;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF9FF),
      bottomNavigationBar: const CustomBottomNavBar(selected: MenuState.course),
      appBar: AppBar(
        title: const Text(
          'Courses',
          style: TextStyle(color: Colors.black),
        ),
        //toolbarTextStyle: TextStyle(de),
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.height * 0.61,
                ),
                child: Row(
                  children: [
                    CategoryCards(
                      topMargin: 16,
                      leftMargin: 24,
                      rightMargin: 35,
                      backgroudColorCard: courseState == CourseState.all
                          ? kPrimaryColor
                          : Colors.white,
                      backgroundColorIcon: courseState == CourseState.all
                          ? Colors.white
                          : Colors.red,
                      text: 'All',
                      icon: courseState == CourseState.all
                          ? CupertinoIcons.square_list_fill
                          : CupertinoIcons.square_list,
                      textColor: courseState == CourseState.all
                          ? Colors.white
                          : Colors.black,
                      iconColor: courseState == CourseState.all
                          ? kPrimaryColor
                          : Colors.white,
                      pressed: () {
                        setState(() {
                          courseState = CourseState.all;
                        });
                      },
                      widthSize: 8,
                    ),
                    CategoryCards(
                      topMargin: 16,
                      leftMargin: 0,
                      rightMargin: 24,
                      backgroudColorCard: courseState == CourseState.onGoing
                          ? kPrimaryColor
                          : Colors.white,
                      backgroundColorIcon: courseState == CourseState.onGoing
                          ? Colors.white
                          : const Color(0xffF5AE2C),
                      text: 'Ongoing',
                      icon: courseState == CourseState.onGoing
                          ? Icons.local_fire_department
                          : Icons.local_fire_department_outlined,
                      textColor: courseState == CourseState.onGoing
                          ? Colors.white
                          : Colors.black,
                      iconColor: courseState == CourseState.onGoing
                          ? kPrimaryColor
                          : Colors.white,
                      pressed: () {
                        setState(() {
                          courseState = CourseState.onGoing;
                        });
                      },
                      widthSize: 8,
                    ),
                    CategoryCards(
                      topMargin: 16,
                      leftMargin: 12,
                      rightMargin: 0,
                      backgroudColorCard: courseState == CourseState.completed
                          ? kPrimaryColor
                          : Colors.white,
                      backgroundColorIcon: courseState == CourseState.completed
                          ? Colors.white
                          : const Color(0xff7283c0),
                      text: 'Completed',
                      icon: courseState == CourseState.completed
                          ? Icons.check_box_rounded
                          : Icons.check_box_outlined,
                      textColor: courseState == CourseState.completed
                          ? Colors.white
                          : Colors.black,
                      iconColor: courseState == CourseState.completed
                          ? kPrimaryColor
                          : Colors.white,
                      pressed: () {
                        setState(() {
                          courseState = CourseState.completed;
                        });
                      },
                      widthSize: 8,
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
