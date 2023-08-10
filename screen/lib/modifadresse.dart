import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/materiel.dart';
import 'ui/customtextfield.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class EditAdressScreen extends StatefulWidget {

  EditAdressScreen({Key? key}) : super(key: key);

  @override
  _EditAdressScreenState createState() => _EditAdressScreenState();
}

class _EditAdressScreenState extends State<EditAdressScreen> {

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> adressInfo = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;


    final nameController = TextEditingController(text: adressInfo['nom_adresse']);


    void ModifyingMateriel() async {
      if (nameController.text.isEmpty) {
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
        final name = nameController.text;
        final id = adressInfo['id'];
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Succes'),
              content: Text('Le materiel a bien ete modifié.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/addadress');
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
        title: Text('Edit Materiel'),
      ),
      body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextField(label: 'Nom', controller: nameController),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      onPressed: () {
                        ModifyingMateriel();
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
          ]
      ),
    );
  }
}
