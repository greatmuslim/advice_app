import 'dart:async';
// import 'dart:math';

import 'package:advice_app/theme.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  startTimer() {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor1,
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Image.asset(
          "assets/images/download.png",
        ),
      ),
    );
  }
}
