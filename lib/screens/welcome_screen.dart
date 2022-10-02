

import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/roundButton.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds:1),
      upperBound: 1,
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey ,end: Colors.white).animate(controller);
    
    controller.forward();
    controller.addListener(() {
      setState(() {

      });

    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.network(
                        "https://64.media.tumblr.com/cfd039730669f89c064f69e57e0877af/tumblr_inline_nvcly19vEU1r2rwhq_500.gif"),
                    height: 180,
                  ),
                ),
                TypewriterAnimatedTextKit(
                    speed : const Duration(milliseconds: 100),
                 text : ['Shark Chat'],
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
        roundedButton(title: 'Log In' ,colour: Colors.lightBlueAccent  ,onPressed: () {
          Navigator.pushNamed(context, LoginScreen.id);
        } ),
            roundedButton(title: 'Register' ,colour: Colors.lightBlue  ,onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            } ),
          ],
        ),
      ),
    );
  }
}


