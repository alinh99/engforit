import 'package:eft_project/Screens/home/components/category_cards.dart';
import 'package:eft_project/Screens/home/components/lesson_cards.dart';
import 'package:eft_project/components/icon_button.dart';
import 'package:eft_project/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  static String id = 'home_screen';
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController();
  Future<LottieComposition> compositionReading;
  Future<LottieComposition> compositionListening;
  Future<LottieComposition> compositionSpeaking;
  Future<LottieComposition> compositionWriting;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionReading = _loadComposition('assets/images/reading.json');
    compositionListening = _loadComposition('assets/images/listening.json');
    compositionWriting = _loadComposition('assets/images/writing.json');
    compositionSpeaking = _loadComposition('assets/images/speaking.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 136),
                        child: Text(
                          'Hello,',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors
                                  .grey[350] //fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Text(
                          'Alonzo Lee 👏',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8, right: 20),
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFFCFD9FF),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      radius: 25,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFEFF9FF),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 24,
                                right: 16,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixIcon: const Icon(Icons.search),
                                  labelText: 'Search',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            //width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                              right: 16,
                              top: 8,
                            ),
                            height: 60,
                            width: 60,
                            child: const Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 24),
                        child: const Text(
                          'Courses',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Column(
                        children: [
                          Row(
                            children: const [
                              CategoryCards(
                                top: 8,
                                left: 24,
                                right: 8,
                                backgroudColorCard: kPrimaryColor,
                                backgroundColorIcon: Colors.white,
                                text: 'All Topic',
                                icon: Icons.local_fire_department_outlined,
                                textColor: Colors.white,
                                iconColor: Color(0xff5CC7ff),
                              ),
                              CategoryCards(
                                top: 8,
                                left: 8,
                                right: 16,
                                backgroudColorCard: Colors.white,
                                backgroundColorIcon: Color(0xffF5AE2C),
                                text: 'Popular',
                                icon: Icons.lightbulb_outline,
                                textColor: Colors.black,
                                iconColor: Colors.white,
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              CategoryCards(
                                top: 8,
                                left: 24,
                                right: 8,
                                backgroudColorCard: Colors.white,
                                backgroundColorIcon: Color(0xff7283c0),
                                text: 'Newest',
                                icon: Icons.star_border_rounded,
                                textColor: Colors.black,
                                iconColor: Colors.white,
                              ),
                              CategoryCards(
                                top: 8,
                                left: 8,
                                right: 16,
                                backgroudColorCard: Colors.white,
                                backgroundColorIcon: Color(0xff54AD67),
                                text: 'Advance',
                                icon: Icons.bookmark_outline,
                                textColor: Colors.black,
                                iconColor: Colors.white,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                LessonCards(
                                  composition: compositionReading,
                                  title: 'Reading',
                                  cardColor: const Color(0xFF54C3FF),
                                  totalLesson: 10,
                                  min: 40,
                                ),
                                LessonCards(
                                  composition: compositionListening,
                                  title: 'Listening',
                                  cardColor: const Color(0xFFF5AE2C),
                                  totalLesson: 10,
                                  min: 60,
                                ),
                                LessonCards(
                                  composition: compositionSpeaking,
                                  title: 'Speaking',
                                  cardColor: const Color(0xFF7383C0),
                                  totalLesson: 10,
                                  min: 60,
                                ),
                                LessonCards(
                                  composition: compositionWriting,
                                  title: 'Writing',
                                  cardColor: const Color(0xFF5AE2E2),
                                  totalLesson: 10,
                                  min: 60,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
