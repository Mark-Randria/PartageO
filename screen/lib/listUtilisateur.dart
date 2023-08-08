import 'package:flutter/material.dart';
import 'package:partageo/ui/custom_list_view_utilisateur.dart';

import 'ui/customtextfield.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class ListUtilisateurScreen extends StatefulWidget {
  const ListUtilisateurScreen({super.key});

  @override
  State<ListUtilisateurScreen> createState() => _ListUtilisateurScreenState();
}

class _ListUtilisateurScreenState extends State<ListUtilisateurScreen> {
  final name = ['Rabe', 'Mark', 'Laza', 'Santa'];
  final address = ['Lot VV 201 F', 'Tanambao', 'Tanambao', 'Tanambao'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des utilisateurs"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // listview of dropdown menu for month, electric consumption, and devices list
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height - 40,
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      // list of devices added with edit and delete button
                      Expanded(
                          flex: 2,
                          child: CustomListviewUtilisateur(
                              name: name,
                              address: address)),    // button to add device

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
