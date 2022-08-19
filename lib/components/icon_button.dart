import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
  const IconButtons({
    @required this.icon,
    this.onTap,
    this.iconColor,
    Key key,
  }) : super(key: key);
  final IconData icon;
  final Function onTap;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        icon,
        color: iconColor,
        size: 24,
      ),
      onTap: () {},
    );
  }
}
