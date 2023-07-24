import 'package:flutter/material.dart';

import 'ui/customtextfield.dart';

Color primaryColor = const Color(0xFF1CA9C9);
Color secondaryColor = const Color(0xFF696969);
Color tertiaryColor = const Color(0xFFE5E4E2);

void main() => runApp(LoginScreen());

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height - 50,
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
                              child: const Icon(Icons.arrow_back, size: 32),
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
                            "Bienvenue !",
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
                            "Connectez-vous pour continuer",
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
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomTextField(
                          label: 'Nom',
                          controller: nameController,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomTextField(
                          label: 'Mot de passe',
                          controller: passwordController,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                        // flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 40.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Se connecter"),
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
