import 'package:flutter/material.dart';

import 'ui/customtextfield.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class ListFactureScreen extends StatefulWidget {
  const ListFactureScreen({super.key});

  @override
  State<ListFactureScreen> createState() => _ListFactureScreenState();
}

class _ListFactureScreenState extends State<ListFactureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: const Text(
                      'Liste des Factures',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ));
  }
}
