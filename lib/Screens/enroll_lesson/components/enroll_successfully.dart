import 'package:eft_project/components/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SuccessfulEnroll extends StatefulWidget {
  static String id = 'enroll_successfully';
  const SuccessfulEnroll({Key key, this.tapped}) : super(key: key);
  final Function tapped;
  @override
  State<SuccessfulEnroll> createState() => _SuccessfulEnrollState();
}

class _SuccessfulEnrollState extends State<SuccessfulEnroll> {
  Future<LottieComposition> compositionLoginSuccessfully;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionLoginSuccessfully =
        _loadComposition('assets/images/loginSuccessfully.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFF56CBFF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Successfully 👆👆',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8CC4EB),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            LottieAnimation(
              composition: compositionLoginSuccessfully,
              height: 0.4,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, right: 64, left: 64),
              decoration: BoxDecoration(
                color: const Color(0xFF8CC4EB),
                borderRadius: BorderRadius.circular(50),
              ),
              child: InkWell(
                onTap: widget.tapped,
                child: const Text(
                  'Proceed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
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
