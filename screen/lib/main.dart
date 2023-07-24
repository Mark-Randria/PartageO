import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';
import 'signup.dart';
import 'signuptype.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partageo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signuptype': (context) => const SignUpTypeScreen(),
        '/signup': (context) => const SignupScreen(),
      },
    );
  }
}
