import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  late final Future<LottieComposition> _composition;
  @override
  void initState() {
    super.initState();
    _composition = _loadComposition();
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load('assets/images/favourite.json');
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
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          );
        } else {
          return SafeArea(
            child: Column(
              children: const [
                SizedBox(
                  height: 350.0,
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
