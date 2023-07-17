import 'package:flutter/material.dart';

void main() => runApp(const LandingPage());

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PartageO',
      home: Scaffold(
        body: Center(
          child: const Text("boobs"),
        ),
      ),
    );
  }
}
