import 'package:flutter/material.dart';
import 'package:eft_project/components/input_container.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({Key key, @required this.icon, @required this.hint})
      : super(key: key);

  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      decoration: InputDecoration(
          icon: Icon(icon, color: Colors.grey),
          hintText: hint,
          border: InputBorder.none),
    ));
  }
}
