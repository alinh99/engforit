import 'package:eft_project/components/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:eft_project/components/rounded_button.dart';
import 'package:eft_project/components/rounded_input.dart';
import 'package:eft_project/components/rounded_password_input.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
    @required this.isLogin,
    @required this.animationDuration,
    @required this.size,
    @required this.defaultLoginSize,
  }) : super(key: key);
  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Future<LottieComposition> composition;
  @override
  void initState() {
    super.initState();
    composition = _loadComposition();
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load('assets/images/login.json');
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 1.0 : 0.0,
      duration: widget.animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: widget.size.width,
          height: widget.defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 40),
                LottieAnimation(
                  composition: composition,
                  height: 0.3,
                ),
                const SizedBox(height: 40),
                const RoundedInput(icon: Icons.mail, hint: 'Username'),
                const RoundedPasswordInput(hint: 'Password'),
                const SizedBox(height: 10),
                const RoundedButton(title: 'LOGIN'),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
