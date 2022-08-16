import 'package:eft_project/splash_screen/calendar.dart';
import 'package:eft_project/splash_screen/favourite.dart';
import 'package:eft_project/splash_screen/certification.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  PageController controller = PageController();
  List<Widget> list = <Widget>[
    const Calendar(),
    const Favourite(),
    const Certification(),
  ];
  int curr = 0;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? SingleChildScrollView(
            child: buildSplashScreen(context, 1.25),
          )
        : buildSplashScreen(context, 0.57);
  }

  Column buildSplashScreen(
    BuildContext context,
    double height,
  ) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                'Skip',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * height,
          child: PageView(
            children: list,
            scrollDirection: Axis.horizontal,
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                curr = value;
              });
            },
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        SmoothPageIndicator(
          controller: controller,
          count: 3,
          axisDirection: Axis.horizontal,
          effect: const CustomizableEffect(
            activeDotDecoration: DotDecoration(
              width: 3,
              height: 3,
              color: Color(0xFF54c2fe),
              dotBorder: DotBorder(
                padding: 2,
                width: 2,
                color: Color(0xFF54c2fe),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(2),
              ),
            ),
            dotDecoration: DotDecoration(
              width: 5,
              height: 5,
              color: Colors.grey,
              dotBorder: DotBorder(
                padding: 2,
                width: 2,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(2),
              ),
              // borderRadius: BorderRadius.circular(16),
              verticalOffset: 0,
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            curr == 0
                ? 'Skills Practice'
                : curr == 1
                    ? 'Quiz Challenge'
                    : 'Certification Ready',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                curr == 0
                    ? 'Our content is written by Oxford English for Information Technology.'
                    : curr == 1
                        ? 'Take a quiz to test your knowledge on your English for IT skills!'
                        : 'Make sure you have a valid certificate after you start learning!',
                style: const TextStyle(
                  //fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(
                  0xFF54c2fe,
                ),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(50.0),
              ),
              color: const Color(0xFF54c2fe),
            ),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(20),
            child: GestureDetector(
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
