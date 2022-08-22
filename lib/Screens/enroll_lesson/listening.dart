import 'package:eft_project/Screens/enroll_lesson/components/enroll_lesson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Listening extends StatefulWidget {
  const Listening({Key key}) : super(key: key);
  static String id = 'listening';
  @override
  State<Listening> createState() => _ListeningState();
}

class _ListeningState extends State<Listening> {
  Future<LottieComposition> compositionListening;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionListening = _loadComposition('assets/images/listening.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EnrollLesson(
        composition: compositionListening,
        title: 'Listening',
        color: const Color(0xffF5AE2C),
      ),
    );
  }
}
