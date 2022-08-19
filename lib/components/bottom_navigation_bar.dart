import 'package:eft_project/components/icon_buttons.dart';
import 'package:eft_project/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({Key key, this.selected}) : super(key: key);
  MenuState selected;
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 55,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 1.4,
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButtons(
                      flexValue: widget.selected == MenuState.home ? 2 : 1,
                      icon: widget.selected == MenuState.home
                          ? Icons.home
                          : CupertinoIcons.home,
                      text: widget.selected == MenuState.home ? 'Home' : '',
                      backgroundColor: widget.selected == MenuState.home
                          ? const Color(0xFF54C2FF)
                          : Colors.white,
                      iconColor: widget.selected == MenuState.home
                          ? Colors.white
                          : const Color(0xffdff3ff),
                      pressed: () {
                        setState(() {
                          widget.selected = MenuState.home;
                        });
                      },
                    ),
                    IconButtons(
                      flexValue: widget.selected == MenuState.favourite ? 2 : 1,
                      icon: widget.selected == MenuState.favourite
                          ? CupertinoIcons.star_fill
                          : CupertinoIcons.star,
                      text: widget.selected == MenuState.favourite
                          ? 'Favourite'
                          : '',
                      backgroundColor: widget.selected == MenuState.favourite
                          ? const Color(0xFF54C2FF)
                          : Colors.white,
                      iconColor: widget.selected == MenuState.favourite
                          ? Colors.white
                          : const Color(0xffdff3ff),
                      pressed: () {
                        setState(() {
                          widget.selected = MenuState.favourite;
                        });
                      },
                    ),
                    IconButtons(
                      flexValue: widget.selected == MenuState.course ? 2 : 1,
                      icon: widget.selected == MenuState.course
                          ? CupertinoIcons.book_fill
                          : CupertinoIcons.book,
                      text: widget.selected == MenuState.course ? 'Course' : '',
                      backgroundColor: widget.selected == MenuState.course
                          ? const Color(0xFF54C2FF)
                          : Colors.white,
                      iconColor: widget.selected == MenuState.course
                          ? Colors.white
                          : const Color(0xffdff3ff),
                      pressed: () {
                        setState(() {
                          widget.selected = MenuState.course;
                        });
                      },
                    ),
                    IconButtons(
                      flexValue: widget.selected == MenuState.quiz ? 2 : 1,
                      icon: widget.selected == MenuState.quiz
                          ? CupertinoIcons.question_circle_fill
                          : CupertinoIcons.question_circle,
                      text: widget.selected == MenuState.quiz ? 'Quiz' : '',
                      backgroundColor: widget.selected == MenuState.quiz
                          ? const Color(0xFF54C2FF)
                          : Colors.white,
                      iconColor: widget.selected == MenuState.quiz
                          ? Colors.white
                          : const Color(0xffdff3ff),
                      pressed: () {
                        setState(() {
                          widget.selected = MenuState.quiz;
                        });
                      },
                    ),
                    IconButtons(
                      flexValue: widget.selected == MenuState.profile ? 2 : 1,
                      icon: widget.selected == MenuState.profile
                          ? CupertinoIcons.person_fill
                          : CupertinoIcons.person,
                      text:
                          widget.selected == MenuState.profile ? 'Profile' : '',
                      backgroundColor: widget.selected == MenuState.profile
                          ? const Color(0xFF54C2FF)
                          : Colors.white,
                      iconColor: widget.selected == MenuState.profile
                          ? Colors.white
                          : const Color(0xffdff3ff),
                      pressed: () {
                        setState(() {
                          widget.selected = MenuState.profile;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
