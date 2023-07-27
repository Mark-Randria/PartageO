import 'package:flutter/material.dart';

Color primaryColor = Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class FactureScreen extends StatefulWidget {
  const FactureScreen({super.key});

  @override
  State<FactureScreen> createState() => _FactureScreenState();
}

class _FactureScreenState extends State<FactureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                color: primaryColor,
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 34.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 15.0),
                            const CircleAvatar(radius: 30.0),
                            const SizedBox(width: 20.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200.0,
                                  color: Colors.red,
                                  child: const Text(
                                    'Nom Utilisateur',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),),
                                ),
                                const SizedBox(height: 10.0),
                                Container(
                                  width: 200.0,
                                  color: Colors.red,
                                  child: const Text(
                                    'Prenom Utilisateur',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
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
                            const SizedBox(height: 20.0),
                            Container(
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
                            const SizedBox(height: 10.0),
                            Container(
                              width: double.infinity,
                              child: const Text(
                                '150.000 Ar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [],
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              Text('body')
            ],
          ),
        ],
      ),
    );
  }
}
