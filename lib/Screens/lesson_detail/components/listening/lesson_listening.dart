import 'package:eft_project/Screens/lesson_detail/components/listening/lesson_detail_listening.dart';
import 'package:eft_project/components/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LessonListening extends StatefulWidget {
  const LessonListening({Key key, this.composition, this.color, this.title})
      : super(key: key);

  final Future<LottieComposition> composition;
  final String title;
  final Color color;
  @override
  State<LessonListening> createState() => _LessonListeningState();
}

class _LessonListeningState extends State<LessonListening> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF9FF),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                children: [
                  ReuseableCard(
                      composition: widget.composition, color: widget.color),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 8, bottom: 16, left: 16, right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffF5AE2C),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Center(
                                child: Text(
                                  'Playlist',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    right: 8,
                                    left: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF6C56A),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  margin: const EdgeInsets.only(left: 8),
                                  child: const Text(
                                    '10',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: const Color(0xffF5AE2C),
                          ),
                          child: const Center(
                            child: Text(
                              'Description',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const LessonDetailListening(
                    title: 'Computer Users',
                    widthSize: 96,
                  ),
                  const LessonDetailListening(
                    title: 'Computer Architecture',
                    widthSize: 50,
                  ),
                  const LessonDetailListening(
                    title: 'Computer Applications',
                    widthSize: 48,
                  ),
                  const LessonDetailListening(
                    title: 'Peripherals',
                    widthSize: 130,
                  ),
                  const LessonDetailListening(
                    title: 'Interview, Former Student',
                    widthSize: 28,
                  ),
                  const LessonDetailListening(
                    title: 'Operating Systems',
                    widthSize: 76,
                  ),
                  const LessonDetailListening(
                    title: 'Graphical User Interfaces',
                    widthSize: 30,
                  ),
                  const LessonDetailListening(
                    title: 'Applications Programs',
                    widthSize: 48,
                  ),
                  const LessonDetailListening(
                    title: 'Multimedia',
                    widthSize: 130,
                  ),
                  const LessonDetailListening(
                    title: 'Computing Support Officer',
                    widthSize: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
