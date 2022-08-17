import 'package:flutter/material.dart';
import 'package:eft_project/components/input_container.dart';
import 'package:eft_project/constants.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({Key key, @required this.hint}) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      cursorColor: kPrimaryColor,
      obscureText: true,
      decoration: InputDecoration(
          icon: const Icon(Icons.lock, color: Colors.grey),
          hintText: hint,
          border: InputBorder.none),
    ));
  }
}
