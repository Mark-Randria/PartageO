import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partageo/controller/adresse.dart';
import 'package:partageo/controller/facture.dart';
import 'package:partageo/controller/materiel.dart';

import 'ui/customtextfield.dart';
import 'utils/token.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class AddFactureScreen extends StatefulWidget {
  const AddFactureScreen({super.key});

  @override
  State<AddFactureScreen> createState() => _AddFactureScreenState();
}

class _AddFactureScreenState extends State<AddFactureScreen> {
  final factureController = TextEditingController();
  final DateController = TextEditingController();
  final montantController = TextEditingController();
  final ranoController = TextEditingController();
  final idadresseController = TextEditingController();
  final nomadresseController = TextEditingController();

  Future fetchData() async {
    final token = await getToken();
    final decodedToken = decodeToken(token);
    print(decodedToken);
    final adresse = await getAdresse();

    return adresse;
  }

  @override
  Widget build(BuildContext context) {

    void AddingFacture() async {
      final token = await getToken();
      final decodedToken = decodeToken(token);
      print(decodedToken);
      if (factureController.text.isEmpty ||
          DateController.text.isEmpty || ranoController.text.isEmpty ||
          montantController.text.isEmpty || idadresseController.text.isEmpty || nomadresseController.text.isEmpty) {
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
        final refFact = factureController.text;
        final date = DateController.text;
        final montant = int.parse(montantController.text);
        final rano = int.parse(ranoController.text);
        final nomAdresse = nomadresseController.text;
        final idAdresse = int.parse(idadresseController.text);
        addFacture(refFact, date, montant, rano, idAdresse);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Succes'),
              content: Text('La Facture a bien ete ajoute.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/moderatorscreen');
                  },
                ),
              ],
            );
          },
        );
      }
    }

    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')));
        } else if (!snapshot.hasData) {
          return Center(child: Text('still fetching data'));
        } else {
          final adresse = snapshot.data[0];
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
                            onPressed: () {
                              Navigator.pushNamed(context, '/listadresse');
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
                    child: CustomTextField(label: 'reference facture', controller: factureController),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: DateController,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2050));

                        if (pickedDate != null) {
                          setState(() {
                            DateController.text =
                                pickedDate.toString().substring(0, 10);
                          });
                        }
                      }, // Show the date picker when the input field is tapped
                      readOnly: true, // Prevent manual text input
                      decoration: InputDecoration(
                        labelText: 'Selectionner la date',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Text('montant jiro'),
                          ),
                          const SizedBox(height: 10.0),
                          TextField(
                            controller: montantController,
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
                            child: Text('montant rano'),
                          ),
                          const SizedBox(height: 10.0),
                          TextField(
                            controller: ranoController,
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

                  const SizedBox(height: 30.0),
                ],
              ));
        }
      },
    );
  }
}
