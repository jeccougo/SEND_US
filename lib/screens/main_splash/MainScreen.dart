import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shop_app/screens/home/home_screen.dart';

import '../splash/splash_screen.dart';



class SecondClass extends StatefulWidget {
  static String routeName = "/mainsplash";
  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(
            PageTransition(
              type: PageTransitionType.bottomToTop,
              child:HomeScreen(),
            ),
          );
          Timer(
            Duration(milliseconds: 300),
                () {
              scaleController.reset();
            },
          );
        }
      },
    );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);

    Timer(Duration(seconds: 2), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff412EEF),
      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 30.0),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'CHORES',
                speed: Duration(milliseconds: 150),
              ),
            ],
            isRepeatingAnimation: false,
            repeatForever: false,
            displayFullTextOnTap: false,
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  HomeScreen()

      );
  }
}