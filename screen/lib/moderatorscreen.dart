import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:partageo/controller/facture.dart';
import 'package:partageo/utils/token.dart';

import 'ui/listviewBuilder.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class ModeratorScreen extends StatefulWidget {
  const ModeratorScreen({Key? key}) : super(key: key);

  @override
  State<ModeratorScreen> createState() => _ModeratorScreenState();
}

class _ModeratorScreenState extends State<ModeratorScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late String selectedFacture;
  late int selectedAdresseId;

  Widget _buildRow(int idx) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('$idx'),
      ),
      title: Text(
        'Item $idx',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  Future fetchData() async {
    final token = await getToken();
    final decodedToken = decodeToken(token);
    print(decodedToken);
    final facture = await getAllFacture();
    final utilisateur = decodedToken['nom'];

    return [utilisateur, facture];
  }

  @override
  Widget build(BuildContext context) {
    const numItems = 20;
    return WillPopScope(
      child: FutureBuilder(
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
            final name = retrievedData[0].toString();
            final refFacture = retrievedData[1];

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                key: _scaffoldKey,
                body: Stack(
                  children: [
                    Positioned.fill(
                      top: -680,
                      child: Transform.rotate(
                        angle: 70 * math.pi / 180,
                        // Rotate by 45 degrees in radians
                        child: Container(
                          color: primaryColor,
                        ),
                        alignment: Alignment
                            .center, // Align the transformed square to the center
                      ),
                    ),
                    ListView(
                      children: [
                        Text(refFacture.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: 40.0,
                                ),
                                onPressed: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: Icon(
                                  Icons.account_circle,
                                  size: 60,
                                  color: primaryColor,
                                ),
                              ),
                              Text(
                                name,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'moderator',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Liste des factures',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButtonFormField(
                            hint: const Text('Facture'),
                            items: [
                              ...List.generate(
                                5,
                                    (index) => DropdownMenuItem(
                                  value: 'Option ${index + 1}',
                                  child: Text('Option ${index + 1}'),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButtonFormField(
                            hint: const Text('Adresse'),
                            items: [
                              ...List.generate(
                                5,
                                    (index) => DropdownMenuItem(
                                  value: 'Option no ${index + 1}',
                                  child: Text('Option no ${index + 1}'),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Container(
                            height: 200,
                            child: CustomListView(
                              itemCount: 5,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                drawer: Drawer(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          color: tertiaryColor,
                          child: Column(
                            children: [
                              const SizedBox(height: 30.0),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.receipt_long_outlined,
                                    size: 35.0,
                                  )),
                              const Text('Factures'),
                              const SizedBox(height: 10.0),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.location_on,
                                    size: 35.0,
                                  )),
                              const Text('Adresse'),
                              const SizedBox(height: 10.0),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.account_circle_outlined,
                                    size: 35.0,
                                  )),
                              const Text('Utilisateurs'),
                              const SizedBox(height: 50.0),
                              IconButton(
                                  onPressed: () {
                                    _scaffoldKey.currentState!.closeDrawer();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 35.0,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
      onWillPop: () async {
        final shouldPop = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Deconnexion'),
              content: Text('Voulez-vous vous deconnecter?'),
              actions: [
                TextButton(
                  child: Text('Annuler'),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
                TextButton(
                  child: Text('Se deconnecter'),
                  onPressed: () {
                    deleteToken();
                    Navigator.pop(context, true);
                  },
                ),
              ],
            );
          },
        );

        // If the user confirmed, pop the dialog
        if (shouldPop) {
          return true;
        } else {
          return false;
        }
      },);
  }
}
