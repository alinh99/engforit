import 'package:flutter/material.dart';

class CategoryCards extends StatelessWidget {
  const CategoryCards({
    this.top,
    this.backgroudColorCard,
    this.backgroundColorIcon,
    this.icon,
    this.iconColor,
    this.left,
    this.right,
    this.text,
    this.textColor,
    Key key,
  }) : super(key: key);
  final double top;
  final double left;
  final double right;
  final String text;
  final Color textColor;
  final IconData icon;
  final Color backgroudColorCard;
  final Color backgroundColorIcon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: top, left: left, right: right),
        height: 60,
        width: 60,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: backgroundColorIcon,
              ),
              margin: const EdgeInsets.only(left: 8),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: backgroudColorCard,
        ),
      ),
    );
  }
}
