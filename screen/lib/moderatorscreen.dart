import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class ModeratorScreen extends StatefulWidget {
  const ModeratorScreen({Key? key}) : super(key: key);

  @override
  State<ModeratorScreen> createState() => _ModeratorScreenState();
}

class _ModeratorScreenState extends State<ModeratorScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Moderator Screen'),
          backgroundColor: primaryColor,
          toolbarHeight: 80.0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              icon: const Icon(Icons.menu, size: 36.0),
            ),
          ],
        ),
        body: const Center(
          child: Text('Moderator Screen'),
        ),
      ),
    );
  }
}
