import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partageo/controller/materiel.dart';

import 'ui/customtextfield.dart';
import 'utils/token.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class AddAdressScreen extends StatefulWidget {
  const AddAdressScreen({super.key});

  @override
  State<AddAdressScreen> createState() => _AddAdressScreenState();
}

class _AddAdressScreenState extends State<AddAdressScreen> {
  final nomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void AddingMateriel() async {
      final token = await getToken();
      final decodedToken = decodeToken(token);
      print(decodedToken);
      if (nomController.text.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erreur'),
              content: Text('Veuillez completer les champs.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        return;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Succes'),
              content: Text('Le materiel a bien ete ajoute.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/facture');
                  },
                ),
              ],
            );
          },
        );
      }
    }

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
                    'ADRESSE',
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
                      onPressed: () {

                      },
                      style: OutlinedButton.styleFrom(
                        maximumSize: const Size(218.0, 50.0),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.list_alt_outlined),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Text('Listes des addresses'),
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
              child: CustomTextField(label: "Nom d'adresse", controller: nomController),
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
