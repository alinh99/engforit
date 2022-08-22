import 'package:eft_project/Screens/enroll_lesson/components/enroll_lesson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Writing extends StatefulWidget {
  const Writing({Key key}) : super(key: key);
  static String id = 'writing';
  @override
  State<Writing> createState() => _WritingState();
}

class _WritingState extends State<Writing> {
  Future<LottieComposition> compositionWriting;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionWriting = _loadComposition('assets/images/writing.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EnrollLesson(
      composition: compositionWriting,
      title: 'Writing',
      color: const Color(0xFF5AE2E2),
    );
  }
}
