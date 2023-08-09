import 'dart:convert';

import 'package:flutter/material.dart';

import 'ui/customtextfield.dart';
import 'controller/adresse.dart';
import 'controller/utilisateur.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  int selectedAddressIndex = 0;
  List addressList = [];

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void addingUser() async {
    if (nameController.text.isEmpty || passwordController.text.isEmpty ||
        emailController.text.isEmpty || addressController.text.isEmpty) {
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
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16.0),
              Text('Veuillez patienter...'),
            ],
          ),
        );
      },
    );

    var connect = false;

    connect = await addUser(
        emailController.text, nameController.text, passwordController.text, 1,
        true);

    if (connect) {
      Navigator.pushNamed(context, '/home');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Connexion echoue. Verifier les valeurs insere'),
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
    }
  }

  fetchData() async {
    final response = await getAdresse();

    return response;
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
          final response = snapshot.data;
          print(response);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height - 40,
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.grey.shade900),
                                    child: const Icon(
                                        Icons.arrow_back, size: 32),
                                  ),
                                ),
                              ],
                            )),
                        const Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(40.0, 0, 0, 0),
                                child: Text(
                                  "S'inscrire",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(40.0, 0, 0, 0),
                                child: Text(
                                  "Créer un nouveau compte",
                                  style: TextStyle(
                                    color: Color(0xFF696969),
                                    height: 1.4,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0),
                              child: CustomTextField(
                                label: 'Nom',
                                controller: nameController,
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0),
                              child: CustomTextField(
                                label: 'E-mail',
                                controller: emailController,
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0),
                              child: CustomTextField(
                                label: 'Mot de passe',
                                controller: passwordController,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButtonFormField<int>(
                            hint: const Text('Adresse'),
                            value: selectedAddressIndex,
                            onChanged: (newValue) {
                              setState(() {
                                selectedAddressIndex = newValue!;
                              });
                            },
                            items: addressList.asMap().entries.map(
                                  (entry) => DropdownMenuItem<int>(
                                value: entry.key,
                                child: Text(entry.value['nom_adresse']),
                              ),
                            ).toList(),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 50.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: () {
                                  addingUser();
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  side: BorderSide(
                                      width: 1, color: primaryColor),
                                ),
                                child: const Text(
                                  "S'inscrire",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
