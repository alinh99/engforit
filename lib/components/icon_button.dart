import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
  const IconButtons({
    @required this.icon,
    this.onTap,
    Key key,
  }) : super(key: key);
  final IconData icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        icon,
        color: Colors.blue,
        size: 24,
      ),
      onTap: () {},
    );
  }
}