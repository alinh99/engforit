import 'package:eft_project/constants.dart';
import 'package:eft_project/enum.dart';
import 'package:flutter/material.dart';

class CategoryCards extends StatefulWidget {
  CategoryCards({
    this.top,
    this.backgroudColorCard,
    this.backgroundColorIcon,
    this.icon,
    this.iconColor,
    this.left,
    this.right,
    this.text,
    this.textColor,
    this.pressed,
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
  final Function pressed;
  @override
  State<CategoryCards> createState() => _CategoryCardsState();
}

class _CategoryCardsState extends State<CategoryCards> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.pressed,
        child: Container(
          margin: EdgeInsets.only(
              top: widget.top, left: widget.left, right: widget.right),
          height: 60,
          width: 60,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  // color: widget.isPressed
                  //     ? Colors.white
                  //     : widget.backgroundColorIcon,
                  color: widget.backgroundColorIcon,
                ),
                margin: const EdgeInsets.only(left: 8),
                child: Icon(
                  widget.icon,
                  color: widget.iconColor,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                widget.text,
                style: TextStyle(
                  //color: widget.isPressed ? Colors.white : widget.textColor,
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            //color: widget.isPressed ? kPrimaryColor : widget.backgroudColorCard,
            color: widget.backgroudColorCard,
          ),
        ),
      ),
    );
  }
}
