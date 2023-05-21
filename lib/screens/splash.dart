import 'dart:async';

import 'package:eyecu/constants.dart';
import 'package:eyecu/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startProgress();
    _navigatetohome(); //Go to home screen
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (context) => HomeScreen()));
  }

  _startProgress() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (mounted) {
        setState(() {
          if (_progress < 1) {
            _progress += 0.01;
          }
        });
      }
      if (_progress >= 1) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo.gif",
              scale: 2,
              gaplessPlayback: true,
              //fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: mainTheme, size: 50
                  //value: _progress, // <-- SEE HERE
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
