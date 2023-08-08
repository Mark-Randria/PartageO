import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partageo/controller/materiel.dart';

import 'ui/customtextfield.dart';
import 'utils/token.dart';

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
  final KwhController = TextEditingController();
  final dureeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void AddingMateriel() async {
      final token = await getToken();
      final decodedToken = decodeToken(token);
      print(decodedToken);
      if (nomController.text.isEmpty ||
          KwhController.text.isEmpty ||
          dureeController.text.isEmpty) {
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
        final kwh = int.parse(KwhController.text);
        final duree = int.parse(dureeController.text);
        addMateriel(nomController.text, duree, kwh, decodedToken['id']);
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/listmateriel');
                      },
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
              child: CustomTextField(label: 'Nom', controller: nomController),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text('duree de consommation (en heure)'),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: dureeController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              )
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text('Nombre de KwH (Kw par heure)'),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: KwhController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      onPressed: () {
                        AddingMateriel();
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
