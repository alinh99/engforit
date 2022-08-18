import 'package:eft_project/components/icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
  }) : super(key: key);

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
                    icon: CupertinoIcons.home,
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: IconButtons(
                    icon: CupertinoIcons.star,
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: IconButtons(
                    icon: CupertinoIcons.book,
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: IconButtons(
                    icon: CupertinoIcons.bell,
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: IconButtons(
                    icon: CupertinoIcons.person,
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