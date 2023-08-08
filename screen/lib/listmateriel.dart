import 'package:flutter/material.dart';

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
                              DataCell(Text('${materielItem['nombre_kw']} kW')),
                              DataCell(Text(
                                  '${materielItem['duree_utilisation']} fois')),
                              DataCell(
                                Row(
                                  children: [
                                    Text('bbbb'),
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {},
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
