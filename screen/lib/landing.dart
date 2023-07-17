import 'package:flutter/material.dart';
import 'dart:async';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
      Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PartageO',
      home: Scaffold(
        body: ListView(
          children: [
            Image.asset('assets/images/HomeLogo.png'),
          ],
        ),
      ),
    );
  }
}
