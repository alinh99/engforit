import 'package:eft_project/components/icon_button.dart';
import 'package:eft_project/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    this.selectedMenu,
    Key key,
  }) : super(key: key);
  final MenuState selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 55,
      decoration: const BoxDecoration(
        //color: Color(),
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
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: IconButtons(
                  icon: MenuState.home != selectedMenu
                      ? CupertinoIcons.home
                      : Icons.home_filled,
                  onTap: () {},
                  iconColor: MenuState.home != selectedMenu
                      ? const Color(0xFFBBE4FA)
                      : const Color(0xFF54C3FF),
                )),
                Expanded(
                  child: IconButtons(
                    icon: MenuState.favourite != selectedMenu
                        ? CupertinoIcons.star
                        : CupertinoIcons.star_fill,
                    onTap: () {},
                    iconColor: MenuState.favourite != selectedMenu
                        ? const Color(0xFFBBE4FA)
                        : const Color(0xFF54C3FF),
                  ),
                ),
                Expanded(
                  child: IconButtons(
                    icon: MenuState.course != selectedMenu
                        ? CupertinoIcons.book
                        : CupertinoIcons.book_fill,
                    onTap: () {},
                    iconColor: MenuState.course != selectedMenu
                        ? const Color(0xFFBBE4FA)
                        : const Color(0xFF54C3FF),
                  ),
                ),
                Expanded(
                  child: IconButtons(
                    icon: MenuState.quiz != selectedMenu
                        ? CupertinoIcons.question_circle
                        : CupertinoIcons.question_circle_fill,
                    onTap: () {},
                    iconColor: MenuState.quiz != selectedMenu
                        ? const Color(0xFFBBE4FA)
                        : const Color(0xFF54C3FF),
                  ),
                ),
                Expanded(
                  child: IconButtons(
                    icon: MenuState.profile != selectedMenu
                        ? CupertinoIcons.person
                        : CupertinoIcons.person_fill,
                    iconColor: MenuState.profile != selectedMenu
                        ? const Color(0xFFBBE4FA)
                        : const Color(0xFF54C3FF),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
