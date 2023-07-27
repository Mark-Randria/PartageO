import 'package:flutter/material.dart';

import 'model/materiel.dart';

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
  List<Materiel> materiel = [];

  Materiel materiel1 = Materiel(
    nom_materiel: "ordinateur",
    duree_utilisation: 10,
    nombre_kw: 20,
    montant: 200000,
    nom_utilisateur: "Jiro",
  );

  Materiel materiel2 = Materiel(
    nom_materiel: "phone",
    duree_utilisation: 10,
    nombre_kw: 12,
    montant: 20000,
    nom_utilisateur: "Landry",
  );

  @override
  void initState() {
    super.initState();
    materiel.add(materiel1);
    materiel.add(materiel2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  height: 260.0,
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
                                    child: const Text(
                                      'Nom Utilisateur',
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
                                    child: const Text(
                                      'Adresse Utilisateur',
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
                                  'Facture du mois de Janvier',
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
                                child: const Text(
                                  '150 000 Ar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                width: double.infinity,
                                child: const Text(
                                  "Total des factures de l'adresse :",
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
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Jiro : 350 000 Ar",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Text(
                                        "Rano : 50 000 Ar",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  )),
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
                            '130 000 Ar',
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
                            '20 000 Ar',
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
                                  materiel[i].nom_materiel,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                              Container(
                                  child: Column(
                                children: [
                                  Text(
                                    materiel[i].montant.toString() + ' Ar',
                                    style: TextStyle(
                                        fontSize: 18.0, color: primaryColor),
                                  ),
                                  Text(
                                    materiel[i].nombre_kw.toString() + ' kW',
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
          onPressed: () {},
          backgroundColor: primaryColor,
          child: const Icon(
            Icons.add,
            size: 32.0,
            color: Colors.white,
          ),
        ));
  }
}
