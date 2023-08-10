import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'constant/global.dart';
import 'controller/utilisateur.dart';
import 'model/materiel.dart';
import 'utils/token.dart';

Color primaryColor = Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class FactureScreen extends StatefulWidget {
  const FactureScreen({super.key});

  @override
  State<FactureScreen> createState() => _FactureScreenState();
}

class _FactureScreenState extends State<FactureScreen> {
  List<String> names = ['Jiro', 'Rano'];
  List<int> amounts = [350000, 50000];
  List<dynamic> info1 = [];
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  Future fetchData() async {
    final token = await getToken();
    final decodedToken = decodeToken(token);
    print(decodedToken);
    final utilisateur = await getOneUserByName(decodedToken['nom'].toString());

    return utilisateur;
  }

  @override
  Widget build(BuildContext context) {
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
            final user = retrievedData.nomUtilisateur;
            final userAdress = retrievedData.nomAdresse;
            double? jiro = retrievedData.montantPayer;
            double? rano = retrievedData.montantRano;
            final materiel = retrievedData.userMateriel;

            double totaljiro = 0.0;

            for (int i = 0; i < materiel.length; i++) {
              totaljiro += materiel[i]['nombre_kw'] * consommationKw;
            }

            double total = jiro! + rano!;

            return Scaffold(
              body: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        height: 200.0,
                        width: MediaQuery.of(context).size.width,
                        color: primaryColor,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 24.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 15.0),
                                  CircleAvatar(
                                    radius: 32.0,
                                    child: Image.asset(
                                      'assets/images/avatar.png',
                                      scale: 0.6,
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200.0,
                                        child: Text(
                                          user,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 6.0),
                                      Container(
                                        width: 200.0,
                                        child: Text(
                                          userAdress,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 14.0),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    width: double.infinity,
                                    child: const Text(
                                      'Facture du mois',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      width: double.infinity,
                                      child: Text(
                                        total.toString() + ' Ar',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/jiro.png'),
                                  const SizedBox(width: 10.0),
                                  const Text(
                                    'Jiro',
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                 jiro.toString() + ' Ar',
                                style: TextStyle(fontSize: 15.0),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/rano.png'),
                                  const SizedBox(width: 10.0),
                                  const Text(
                                    'Rano',
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                rano.toString() + ' Ar',
                                style: TextStyle(fontSize: 15.0),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          44.0, 22.0, 44.0, 0.0),
                      width: double.infinity,
                      child: Text('Activités',
                          style: TextStyle(
                              fontSize: 22.0, color: Colors.grey.shade500)),
                    ),
                    for (int i = 0; i < materiel.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 44.0, vertical: 10.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      materiel[i]['nom_materiel'],
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.grey.shade600),
                                    ),
                                  ),
                                  Container(
                                      child: Column(
                                        children: [
                                          Text(
                                        (materiel[i]['nombre_kw'] * consommationKw).toString() + ' Ar',
                                            style: TextStyle(
                                                fontSize: 18.0, color: primaryColor),
                                          ),
                                          Text(
                                            materiel[i]['nombre_kw'].toString() + ' kW',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.grey.shade500),
                                          ),
                                          Text(
                                            ' fois',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.grey.shade500),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
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
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                Navigator.pushNamed(context, '/addmateriel');
              },
                backgroundColor: primaryColor,
                child: const Icon(
                  Icons.add,
                  size: 32.0,
                  color: Colors.white,
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
