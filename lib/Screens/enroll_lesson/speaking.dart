import 'package:eft_project/Screens/enroll_lesson/components/enroll_lesson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Speaking extends StatefulWidget {
  const Speaking({Key key}) : super(key: key);
  static String id = 'speaking';
  @override
  State<Speaking> createState() => _SpeakingState();
}

class _SpeakingState extends State<Speaking> {
  Future<LottieComposition> compositionSpeaking;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionSpeaking = _loadComposition('assets/images/speaking.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EnrollLesson(
      composition: compositionSpeaking,
      title: 'Speaking',
      color: const Color(0xFF7383C0),
    );
  }
}
