import 'dart:math' as math;

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
  Widget _buildRow(int idx) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('$idx'),
      ),
      title: Text(
        'Item $idx',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const numItems = 20;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              top: -680,
              child: Transform.rotate(
                angle: 70 * math.pi / 180,
                // Rotate by 45 degrees in radians
                child: Container(
                  color: primaryColor,
                ),
                alignment: Alignment
                    .center, // Align the transformed square to the center
              ),
            ),
            ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: Icon(
                        Icons.menu,
                        size: 42,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Icon(
                          Icons.account_circle,
                          size: 60,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        'Rabe',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Moderateur',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Facture du mois',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: DropdownButtonFormField(
                    hint: const Text('Facture'),
                    items: [
                      ...List.generate(
                        5,
                        (index) => DropdownMenuItem(
                          value: 'Option ${index + 1}',
                          child: Text('Option ${index + 1}'),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DropdownButtonFormField(
                    hint: const Text('Adresse'),
                    items: [
                      ...List.generate(
                        5,
                        (index) => DropdownMenuItem(
                          value: 'Option no ${index + 1}',
                          child: Text('Option no ${index + 1}'),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
