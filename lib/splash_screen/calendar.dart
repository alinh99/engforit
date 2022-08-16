import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late final Future<LottieComposition> _composition;
  @override
  void initState() {
    super.initState();
    _composition = _loadComposition();
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load('assets/images/calendar.json');
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (cotext, snapshot) {
        var composition = snapshot.data;
        if (composition != null) {
          return Lottie(
            composition: composition,
            alignment: Alignment.center,
          );
        } else {
          return SafeArea(
            child: Column(
              children: const [
                SizedBox(
                  height: 300.0,
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Loading...')
              ],
            ),
          );
        }
      },
    );
  }
}
