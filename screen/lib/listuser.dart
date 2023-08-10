import 'package:flutter/material.dart';
import 'package:partageo/controller/utilisateur.dart';

import 'ui/customtextfield.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class ListUserScreen extends StatefulWidget {
  const ListUserScreen({super.key});

  @override
  State<ListUserScreen> createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {

  Future fetchData() async {
    final utilisateur = await getAllUser();

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
                          'Liste des Utilisateurs',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    children: [
                      for (final user in retrievedData)
                        if (user['nom_utilisateur'] != null)
                        ListTile(
                          title: Text(user['nom_utilisateur']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Montant Payer: ${user['montant_payer'] ?? 'N/A'}'),
                              Text('Montant Rano: ${user['montant_rano'] ?? 'N/A'}'),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ));
        }
      },
    );
  }
}
