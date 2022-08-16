import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  Future<LottieComposition> composition;
  Future<LottieComposition> compositionGoogle;
  Future<LottieComposition> compositionFacebook;
  StreamSubscription<bool> subscription;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    composition = _loadComposition();
    compositionGoogle = _loadCompositionLogoGoogle();
    compositionFacebook = _loadCompositionLogoFacebook();
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load('assets/images/login.json');
    return await LottieComposition.fromByteData(assetData);
  }

  Future<LottieComposition> _loadCompositionLogoGoogle() async {
    var assetData = await rootBundle.load('assets/images/google.json');
    return await LottieComposition.fromByteData(assetData);
  }

  Future<LottieComposition> _loadCompositionLogoFacebook() async {
    var assetData = await rootBundle.load('assets/images/facebook.json');
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<LottieComposition>(
              future: composition,
              builder: (cotext, snapshot) {
                var composition = snapshot.data;
                if (composition != null) {
                  return Center(
                    child: Lottie(
                      composition: composition,
                      alignment: Alignment.center,
                      fit: BoxFit.fitHeight,
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
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
            ),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    //height: MediaQuery.of(context).size.height * 0.1,
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => {email = value},
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      onChanged: (value) => {email = value},
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.password),
                        suffix: GestureDetector(
                          child: const Text(
                            'Forgot?',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(
                            0xFF54c2fe,
                          ),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        color: const Color(0xFF54c2fe),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.all(20),
                      child: GestureDetector(
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Align(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'Or, login with ...',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    composition: compositionGoogle,
                    height: 0.1,
                    onTap: () {},
                  ),
                  IconButton(
                    composition: compositionFacebook,
                    height: 0.04,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text('New to English For IT? '),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.blue[900], fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  const IconButton({
    Key key,
    @required Future<LottieComposition> composition,
    @required this.height,
    @required this.onTap,
  })  : _composition = composition,
        super(key: key);

  final Future<LottieComposition> _composition;
  final double height;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (context, snapshot) {
        var composition = snapshot.data;

        if (composition != null) {
          return Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: onTap,
              child: Lottie(
                repeat: false,
                composition: composition,
                alignment: Alignment.center,
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * height,
              ),
            ),
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
