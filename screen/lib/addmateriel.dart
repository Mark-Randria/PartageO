import 'package:flutter/material.dart';

import 'ui/customtextfield.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class AddMaterielScreen extends StatefulWidget {
  const AddMaterielScreen({super.key});

  @override
  State<AddMaterielScreen> createState() => _AddMaterielScreenState();
}

class _AddMaterielScreenState extends State<AddMaterielScreen> {
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
                    'MATERIELS ELECTROMENAGERS',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 28.0,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        maximumSize: const Size(258.0, 50.0),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.list_alt_outlined),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Text('Listes des électroménagers'),
                        ],
                      ),
                    ),
                  ],
                )
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
                          const Text('Ajouter'),
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
