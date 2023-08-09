import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/materiel.dart';
import 'ui/customtextfield.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class EditMaterielScreen extends StatefulWidget {

  EditMaterielScreen({Key? key}) : super(key: key);

  @override
  _EditMaterielScreenState createState() => _EditMaterielScreenState();
}

class _EditMaterielScreenState extends State<EditMaterielScreen> {

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> materielItem = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    
    String convertNumber(double number) {
      if (number == number.toInt()) {
        return number.toInt().toString();
      } else {
        return number.toString();
      }
    }
    

    final nameController = TextEditingController(text: materielItem['nom_materiel']);
    final kwhController = TextEditingController(text: convertNumber(materielItem['nombre_kw']));
    final dureeController = TextEditingController(text: convertNumber(materielItem['duree_utilisation']));


    void ModifyingMateriel() async {
      if (nameController.text.isEmpty ||
          kwhController.text.isEmpty ||
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
        final name = nameController.text;
        final kwh = int.parse(kwhController.text);
        final duree = int.parse(dureeController.text);
        final idUser = int.parse(materielItem['id_user'].toString());
        final id = materielItem['id'];
        updateMateriel(id, name, duree, kwh, idUser);
        print('$id, $kwh, $duree, $idUser');
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
                    Navigator.of(context).pushNamed('/addmateriel');
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
                  controller: kwhController,
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
