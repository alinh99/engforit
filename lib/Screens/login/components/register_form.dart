import 'package:eft_project/Screens/login/successfully_register.dart';
import 'package:eft_project/components/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:eft_project/components/rounded_button.dart';
import 'package:eft_project/components/rounded_input.dart';
import 'package:eft_project/components/rounded_password_input.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
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
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  Future<LottieComposition> composition;
  @override
  void initState() {
    super.initState();
    composition = _loadComposition();
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load('assets/images/register.json');
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 0.0 : 1.0,
      duration: widget.animationDuration * 5,
      child: Visibility(
        visible: !widget.isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: widget.size.width,
            height: widget.defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    child: LottieAnimation(
                      composition: composition,
                      height: 0.2,
                    ),
                    onTap: () {
                      //print('worked');
                    },
                  ),
                  const SizedBox(height: 10),
                  const RoundedInput(icon: Icons.mail, hint: 'Email'),
                  const RoundedInput(icon: Icons.face_rounded, hint: 'Name'),
                  const RoundedInput(icon: Icons.cake_outlined, hint: 'Age'),
                  const RoundedPasswordInput(hint: 'Password'),
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SuccessfulRegister.id);
                    },
                    child: const RoundedButton(title: 'SIGN UP'),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
