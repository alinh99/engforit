import 'package:flutter/material.dart';
import 'package:eft_project/components/input_container.dart';
import 'package:eft_project/constants.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({Key key, @required this.hint, this.icon}) : super(key: key);
  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      cursorColor: kPrimaryColor,
      obscureText: true,
      decoration: InputDecoration(
        icon:  Icon(icon, color: Colors.grey),
        hintText: hint,
        border: InputBorder.none,
      ),
    ));
  }
}
