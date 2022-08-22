import 'package:eft_project/Screens/enroll_lesson/components/enroll_successfully.dart';
import 'package:flutter/material.dart';

class EnrollButton extends StatefulWidget {
  const EnrollButton({Key key}) : super(key: key);

  @override
  EnrollButtonState createState() => EnrollButtonState();
}

class EnrollButtonState extends State<EnrollButton> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    // return Scaffold(
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SuccessfulEnroll.id);
      },
      child: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: const Color(0xFF54C3FF),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Center(
          child: Text(
            'Enroll now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
    // );
  }
}
