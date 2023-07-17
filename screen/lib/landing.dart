import 'package:flutter/material.dart';

void main() => runApp(const LandingScreen());

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

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
