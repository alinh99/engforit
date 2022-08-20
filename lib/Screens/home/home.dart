import 'package:eft_project/components/category_cards.dart';
import 'package:eft_project/Screens/home/components/lesson_cards.dart';
import 'package:eft_project/components/bottom_navigation_bar.dart';
import 'package:eft_project/constants.dart';
import 'package:eft_project/enum.dart';
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
  int selectedIndex = 0;
  Future<LottieComposition> compositionReading;
  Future<LottieComposition> compositionListening;
  Future<LottieComposition> compositionSpeaking;
  Future<LottieComposition> compositionWriting;
  CategoryState categorySelected;
  MenuState menuSelected;
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
    categorySelected = CategoryState.all;
    menuSelected = MenuState.home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(selected: MenuState.home),
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
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(right: 114),
                        child: Text(
                          'Hello,',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors
                                  .grey[350] //fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Text(
                          'Dien\'s pet 👏',
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
                      radius: 25,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
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

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kPrimaryColor,
                            ),
                            child: const Icon(
                              Icons.filter_list,
                              color: Colors.white,
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
                            children: [
                              CategoryCards(
                                topMargin: 8,
                                leftMargin: 24,
                                rightMargin: 8,
                                backgroudColorCard:
                                    categorySelected == CategoryState.all
                                        ? kPrimaryColor
                                        : Colors.white,
                                backgroundColorIcon:
                                    categorySelected == CategoryState.all
                                        ? Colors.white
                                        : Colors.red,
                                text: 'All Topic',
                                icon: categorySelected == CategoryState.all
                                    ? Icons.local_fire_department
                                    : Icons.local_fire_department_outlined,
                                textColor: categorySelected == CategoryState.all
                                    ? Colors.white
                                    : Colors.black,
                                iconColor: categorySelected == CategoryState.all
                                    ? kPrimaryColor
                                    : Colors.white,
                                pressed: () {
                                  setState(() {
                                    categorySelected = CategoryState.all;
                                  });
                                },
                                widthSize: 16,
                              ),
                              CategoryCards(
                                topMargin: 8,
                                leftMargin: 8,
                                rightMargin: 16,
                                backgroudColorCard:
                                    categorySelected == CategoryState.popular
                                        ? kPrimaryColor
                                        : Colors.white,
                                backgroundColorIcon:
                                    categorySelected == CategoryState.popular
                                        ? Colors.white
                                        : const Color(0xffF5AE2C),
                                text: 'Popular',
                                icon: categorySelected == CategoryState.popular
                                    ? Icons.lightbulb
                                    : Icons.lightbulb_outline,
                                textColor:
                                    categorySelected == CategoryState.popular
                                        ? Colors.white
                                        : Colors.black,
                                iconColor:
                                    categorySelected == CategoryState.popular
                                        ? kPrimaryColor
                                        : Colors.white,
                                pressed: () {
                                  setState(() {
                                    categorySelected = CategoryState.popular;
                                  });
                                },
                                widthSize: 16,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CategoryCards(
                                topMargin: 8,
                                leftMargin: 24,
                                rightMargin: 8,
                                backgroudColorCard:
                                    categorySelected == CategoryState.newest
                                        ? kPrimaryColor
                                        : Colors.white,
                                backgroundColorIcon:
                                    categorySelected == CategoryState.newest
                                        ? Colors.white
                                        : const Color(0xff7283c0),
                                text: 'Newest',
                                icon: categorySelected == CategoryState.newest
                                    ? Icons.star
                                    : Icons.star_border,
                                textColor:
                                    categorySelected == CategoryState.newest
                                        ? Colors.white
                                        : Colors.black,
                                iconColor:
                                    categorySelected == CategoryState.newest
                                        ? kPrimaryColor
                                        : Colors.white,
                                pressed: () {
                                  setState(() {
                                    categorySelected = CategoryState.newest;
                                  });
                                },
                                widthSize: 16,
                              ),
                              CategoryCards(
                                topMargin: 8,
                                leftMargin: 8,
                                rightMargin: 16,
                                backgroudColorCard:
                                    categorySelected == CategoryState.advance
                                        ? kPrimaryColor
                                        : Colors.white,
                                backgroundColorIcon:
                                    categorySelected == CategoryState.advance
                                        ? Colors.white
                                        : const Color(0xff54AD67),
                                text: 'Advance',
                                icon: categorySelected == CategoryState.advance
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline,
                                textColor:
                                    categorySelected == CategoryState.advance
                                        ? Colors.white
                                        : Colors.black,
                                iconColor:
                                    categorySelected == CategoryState.advance
                                        ? kPrimaryColor
                                        : Colors.white,
                                pressed: () {
                                  setState(() {
                                    categorySelected = CategoryState.advance;
                                  });
                                },
                                widthSize: 16,
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
