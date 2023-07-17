import 'package:flutter/material.dart';

void main() => runApp(const LandingScreen());

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PartageO',
      home: Scaffold(body: Image.asset('assets/images/HomeLogo.svg')),
    );
  }
}
