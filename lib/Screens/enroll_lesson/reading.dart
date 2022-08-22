import 'package:eft_project/Screens/enroll_lesson/components/enroll_lesson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Reading extends StatefulWidget {
  const Reading({Key key}) : super(key: key);
  static String id = 'reading';
  @override
  State<Reading> createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  Future<LottieComposition> compositionReading;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionReading = _loadComposition('assets/images/reading.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EnrollLesson(
      composition: compositionReading,
      title: 'Reading',
      color: const Color(0xff54C3FF),
    );
  }
}
