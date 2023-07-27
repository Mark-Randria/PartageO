import 'package:flutter/material.dart';

import 'ui/customtextfield.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class ModeratorFactureScreen extends StatefulWidget {
  const ModeratorFactureScreen({super.key});

  @override
  State<ModeratorFactureScreen> createState() => _ModeratorFactureScreenState();
}

class _ModeratorFactureScreenState extends State<ModeratorFactureScreen> {
  final referenceController = TextEditingController();
  final jiroController = TextEditingController();
  final ranoController = TextEditingController();
  final dateController = TextEditingController();

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
                    'FACTURES',
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
                        maximumSize: const Size(210.0, 50.0),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.list_alt_outlined),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Text('Listes des factures'),
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
                  label: 'Référence Facture', controller: referenceController),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextField(
                  label: 'Montant Jiro', controller: jiroController),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextField(
                  label: 'Montant Rano', controller: ranoController),
            ),
            const SizedBox(height: 20.0),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: const Text('Date'),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 12.0),
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2050));

                        if (pickedDate != null) {
                          setState(() {
                            dateController.text =
                                pickedDate.toString().substring(0, 10);
                          });
                        }
                      },
                    ),
                  ],
                )),
            const SizedBox(height: 30.0),
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
