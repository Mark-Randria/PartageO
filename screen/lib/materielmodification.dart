import 'package:flutter/material.dart';

import 'ui/customtextfield.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class MaterielModificationScreen extends StatefulWidget {
  const MaterielModificationScreen({super.key});

  @override
  State<MaterielModificationScreen> createState() => _MaterielModificationScreenState();
}

class _MaterielModificationScreenState extends State<MaterielModificationScreen> {
  final nomController = TextEditingController();
  final montantController = TextEditingController();

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
                    'Modification',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextField(
                  label: 'Nom', controller: nomController),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextField(
                  label: 'Montant par KW', controller: montantController),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      onPressed: () {

                      },
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor)),
                      child: Row(
                        children: [
                          const Text('Modifier'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20.0),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30.0),
          ],
        ));
  }
}
