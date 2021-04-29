import 'package:p_paycsv/screens/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 7,
        navigateAfterSeconds: new MyHome(),
        title: new Text(
          'Welcome In Payments App',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.amber.shade900),
        ),
        image: new Image.asset('asset/icon.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 150.0,
        loaderColor: Colors.red);
  }
}
