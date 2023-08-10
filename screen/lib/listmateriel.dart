import 'package:flutter/material.dart';
import 'package:partageo/controller/materiel.dart';

import 'controller/utilisateur.dart';
import 'utils/token.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class ListMaterielScreen extends StatefulWidget {
  const ListMaterielScreen({super.key});

  @override
  State<ListMaterielScreen> createState() => _ListMaterielScreenState();
}

class _ListMaterielScreenState extends State<ListMaterielScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future fetchData() async {
    final token = await getToken();
    final decodedToken = decodeToken(token);
    final utilisateur = await getOneUserByName(decodedToken['nom'].toString());

    return utilisateur;
  }

  String convertNumber(double number) {
    if (number == number.toInt()) {
      return number.toInt().toString();
    } else {
      return number.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
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
          final retrievedData = snapshot.data;
          final materiel = retrievedData.userMateriel;
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
                        child: Text(
                          'Liste des matériels électroménagers',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: <DataColumn>[
                        DataColumn(label: Text('Materiel')),
                        DataColumn(label: Text('Consommation')),
                        DataColumn(label: Text('Info')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: [
                        for (var materielItem in materiel)
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(materielItem['nom_materiel'])),
                              DataCell(Text('${convertNumber(materielItem['nombre_kw'])} KwH')),
                              DataCell(Text(
                                  '${convertNumber(materielItem['duree_utilisation'])} hrs')),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/modifmateriel',
                                          arguments: materielItem,
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Confirmer la suppression'),
                                              content: Text('Voulez-vous supprimer le materiel ${materielItem['nom_materiel']}?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    deleteMateriel(materielItem['id']);
                                                  },
                                                  child: Text('Confirmer'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Annuler'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  )
                ],
              ));
        }
      },
    );
  }
}
